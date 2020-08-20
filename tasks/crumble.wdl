version 1.0

# MobiDL 2.0 - MobiDL 2 is a collection of tools wrapped in WDL to be used in any WDL pipelines.
# Copyright (C) 2020  MoBiDiC
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Create a task crumbleAdvanced for all options
task crumble {
	meta {
		author: "Charles VAN GOETHEM"
		email: "c-vangoethem(at)chu-montpellier.fr"
		version: "0.0.1"
		date: "2020-07-31"
	}

	input {
		String path_exe = "crumble"

		File in
		String? outputPath
		String? name
		String suffix = ".crumble"

		String? outputFormat
		Boolean addPGHeader = true

		Int compressionLevel = 9

		Int threads = 1
	}

	String ext = if defined(outputFormat) then outputFormat else sub(basename(in),"(.*)\.(bam|cram|sam)","$2")
	String baseName = if defined(name) then name else sub(basename(in),"(\.bam|\.cram|\.sam)","")
	String outputFile = if defined(outputPath) then "~{outputPath}/~{baseName}~{suffix}.~{ext}" else "~{baseName}~{suffix}.~{ext}"

	command <<<

		if [[ ! -d $(dirname ~{outputFile}) ]]; then
			mkdir -p $(dirname ~{outputFile})
		fi

		~{path_exe} \
			-~{compressionLevel} \
			-O ~{ext},nthreads=~{threads} \
			~{true="" false="-z" addPGHeader} \
			~{in} \
			~{outputFile}

	>>>

	output {
		File outputFile = outputFile
	}

	parameter_meta {
		path_exe: {
			description: 'Path used as executable [default: "dwgsim"]',
			category: 'optional'
		}
		outputPath: {
			description: 'Output path where files were generated. [default: pwd()]',
			category: 'optional'
		}
		name: {
			description: 'Name to use for output file name [default: dwgsim-illumina]',
			category: 'optional'
		}
		in: {
			description: 'Fasta file used to create fastq.',
			category: 'Required'
		}
		suffix: {
			description: 'Suffix to add to the output [default: .crumble]',
			category: 'optional'
		}
		outputFormat: {
			description: 'Output format [default: ext of input file]',
			category: 'optional'
		}
		addPGHeader: {
			description: 'Add an @PG SAM header line [default: true]',
			category: 'optional'
		}
		compressionLevel: {
			description: 'Specify compression level of the resulting file (1, 3, 5, 7, 8 or 9) [default: 9]',
			category: 'optional'
		}
		threads: {
			description: 'Sets the number of threads [default: 1]',
			category: 'optional'
		}
	}
}
