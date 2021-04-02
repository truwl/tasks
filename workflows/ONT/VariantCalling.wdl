version 1.0

# MobiDL 2.0 - MobiDL 2 is a collection of tools wrapped in WDL to be used in any WDL pipelines.
# Copyright (C) 2021 MoBiDiC
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

import "../../tasks/bash.wdl" as bash
import "../../tasks/minimap2.wdl" as minimap2
import "../../tasks/sambamba.wdl" as sambamba
import "../../tasks/clair.wdl" as clair

workflow variantCallingONT {
	meta {
		author: "MoBiDiC"
		email: "c-vangoethem(at)chu-montpellier.fr"
		version: "0.0.1"
		date: "2021-04-02"
	}

	input {
		String fastqPath
		String outputRep

		File refFa
		File refFai

		String modelPath

		Int qual = 748

		String? name
	}

	String sampleName = if defined(name) then "~{name}" else "sample"

################################################################################
	call bash.findFiles as FF {
		input :
			path = fastqPath,
			regexpName = "*.fastq",
			maxDepth = 1
	}
	call bash.concatenateFiles as ConcFQ {
		input :
			in = FF.files,
			name = sampleName,
			outputPath = outputRep + "/fastq_concatenate/"
	}
	call minimap2.mapOnt as align {
		input :
			fastq = ConcFQ.outputFile,
			refFasta = refFa,
			sample = sampleName,
			outputPath = outputRep + "/Alignment/"
	}
	call sambamba.index as idxBam {
		input :
			in = ConcFQ.outputFile,
			outputPath = outputRep + "/Alignment/"
	}
	call clair.callVarBam {
		input :
			modelPath = modelPath,
			refGenome = refFa,
			refGenomeIndex = refFai,
			bamFile = align.outputFile,
			bamFileIndex = idxBam.outputFile,
			sampleName = sampleName,
			qual = qual,
			outputPath = outputRep + "/Variant-Calling/"
	}
	call bcftools.view {
		input :

	}

################################################################################

################################################################################

}