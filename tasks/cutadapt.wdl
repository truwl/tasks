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

# NOTE: currently only a few output options are available
task adaptersTrimming {
	meta {
		author: "Charles VAN GOETHEM"
		email: "c-vangoethem(at)chu-montpellier.fr"
		version: "0.0.1"
		date: "2020-09-24"
	}

	input {
		String path_exe = "cutadapt"

		File in
		String? outputPath
		String? name
		String suffix = ".adaptersTrim"
		String subString = "(_S[0-9]+)?(_L[0-9][0-9][0-9])?(_R[12])?(_[0-9][0-9][0-9])?.(fastq|fq)(.gz)?"
		String subStringReplace = ""

		String type = "a"
		File adapters

		Float errorRate = 0.1
		Boolean allowedIndels = true
		Int times = 1
		Int overlap = 3
		Boolean allowedWildards = true
		String action = "trim"
		Boolean checkRevComp = false

		Boolean minimalReport = false
		Boolean lowComp = false

		Int threads = 1
	}

	String baseName = if defined(name) then name else sub(basename(in),subString,subStringReplace)
	String outputFile = if defined(outputPath) then "~{outputPath}/~{baseName}~{suffix}.fastq.gz" else "~{baseName}~{suffix}.fastq.gz"

	command <<<

		if [[ ! -d $(dirname ~{outputFile}) ]]; then
			mkdir -p $(dirname ~{outputFile})
		fi

		~{path_exe} \
			--cores ~{threads} \
			-~{type} file:~{adapters} \
			--error-rate ~{errorRate} \
			~{true="" false="--no-indels" allowedIndels} \
			--times ~{times} \
			--overlap ~{overlap} \
			~{true="" false="--no-match-adapter-wildcards" allowedWildards} \
			--action ~{action} \
			~{true="--revcomp" false="" checkRevComp} \
			--report ~{true="minimal" false="full" minimalReport} \
			~{true="-Z" false="" lowComp} \
			--output ~{outputFile} \
			~{in}

	>>>

	output {
		File outputFile = outputFile
	}

	parameter_meta {
		path_exe: {
			description: 'Path used as executable [default: "cutadapt"]',
			category: 'optional'
		}
		outputPath: {
			description: 'Output path where files were generated. [default: pwd()]',
			category: 'optional'
		}
		name: {
			description: 'Name to use for output file name [default: sub(basename(in),subString,subStringReplace)]',
			category: 'optional'
		}
		in: {
			description: 'Input reads (format: fastq, fastq.gz)',
			category: 'Required'
		}
		suffix: {
			description: 'Suffix to add to the output [default: .adaptersTrim]',
			category: 'optional'
		}
		subString: {
			description: 'Extension to remove from the input file [default: "(_S[0-9]+)?(_L[0-9][0-9][0-9])?(_R[12])?(_[0-9][0-9][0-9])?.(fastq|fq)(.gz)?"]',
			category: 'optional'
		}
		subStringReplace: {
			description: 'subString replace by this string [default: ""]',
			category: 'optional'
		}
		type: {
			description: 'Type of adapters (choices: "a": 3\' end; "g": 5\' end, "b": both 3\' or 5\' end)[default: "a"]',
			category: 'optional'
		}
		adapters: {
			description: 'File containing adapters sequences',
			category: 'Required'
		}
		errorRate: {
			description: 'Maximum allowed error rate as value between 0 and 1 [default: 0.01]',
			category: 'optional'
		}
		allowedIndels: {
			description: 'Allow mismatches and indels in alignments or only mismatches. [default: true]',
			category: 'optional'
		}
		times: {
			description: 'Remove up to TIMES adapters from each read. [default: 1]',
			category: 'optional'
		}
		overlap: {
			description: 'Minimum overlap between read and adapter for an adapter to be found. [default: 3]',
			category: 'optional'
		}
		allowedWildards: {
			description: 'Interpret IUPAC wildcards in adapters. [default: true]',
			category: 'optional'
		}
		action: {
			description: 'Action to do with adapters (choices: trim,mask,lowercase,none)[default: "trim"]',
			category: 'optional'
		}
		checkRevComp: {
			description: 'Check both the read and its reverse complement for adapter matches. [default: false]',
			category: 'optional'
		}
		minimalReport: {
			description: 'Which type of report to print: "full" or "minimal". [default: "full"]',
			category: 'optional'
		}
		lowComp: {
			description: 'Use compression level 1 for gzipped output files [default: false]',
			category: 'optional'
		}
		threads: {
			description: 'Sets the number of threads [default: 1]',
			category: 'optional'
		}
	}
}