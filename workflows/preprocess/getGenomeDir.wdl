version 1.0

# MobiDL 2.0 - MobiDL 2 is a collection of tools wrapped in WDL to be used in any WDL pipelines.
# Copyright (C) 2020 MoBiDiC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

import "../../tasks/rsync.wdl" as rsync
import "../../tasks/bwa.wdl" as bwa
import "../../tasks/bash.wdl" as bash
import "../../tasks/samtools.wdl" as samtools

workflow getGenomeDir {
	meta {
		author: "Charles VAN GOETHEM"
		email: "c-vangoethem(at)chu-montpellier.fr"
		date: "2020-12-04"
		version: "0.0.1"
	}

	input {
		String outputPath
		String linkFa
	}

################################################################################

	call rsync.rsync as getFasta {
		input :
			in = linkFa,
			outputPath = outputPath
	}

	call bash.gzip as gunzipFasta {
		input :
			in = getFasta.outputFile,
			outputPath = outputPath,
			decompress = true
	}

	call bwa.index as BwaIndexGenome {
		input :
			in = gunzipFasta.outputFile,
			outputPath = outputPath
	}

	call samtools.faidx as SamtoolsIndexGenome {
		input :
			in = gunzipFasta.outputFile,
			outputPath = outputPath
	}

	call samtools.dict as SamtoolsDictGenome {
		input :
			in = gunzipFasta.outputFile,
			outputPath = outputPath
	}

################################################################################

	output {
		File refFasta = gunzipFasta.outputFile
		File refFai = SamtoolsIndexGenome.outputFile
		File refDict = SamtoolsDictGenome.outputFile
		File refAmb = BwaIndexGenome.refAmb
		File refAnn = BwaIndexGenome.refAnn
		File refBwt = BwaIndexGenome.refBwt
		File refPac = BwaIndexGenome.refPac
		File refSa = BwaIndexGenome.refSa
	}

	parameter_meta {
		outputPath : {
			outputPath: 'Path where files will be written.',
			category: 'Output'
		}
		linkFa : {
			description: 'Link to a fasta to download (format: *.fa.gz)',
			category: 'Input'
		}
	}
}