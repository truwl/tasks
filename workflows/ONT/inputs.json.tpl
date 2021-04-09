{
	"variantCallingONT.fastqPath": "String",
	"variantCallingONT.refFa": "File",
	"variantCallingONT.refFai": "File",
	"variantCallingONT.modelPath": "String",
	"variantCallingONT.outputPath": "String",

	"variantCallingONT.qual": 748,
	"variantCallingONT.bedRegions": "File? (optional)",
	"variantCallingONT.name": "String? (optional)",

	"variantCallingONT.BED2ARRAY.memoryByThreads": 768,
	"variantCallingONT.BED2ARRAY.threads": 1,
	"variantCallingONT.CALLVARBAM.activation_only": false,
	"variantCallingONT.CALLVARBAM.dcov": 250,
	"variantCallingONT.CALLVARBAM.debug": false,
	"variantCallingONT.CALLVARBAM.fastPlotting": false,
	"variantCallingONT.CALLVARBAM.haploidPrecision": false,
	"variantCallingONT.CALLVARBAM.haploidSensitive": false,
	"variantCallingONT.CALLVARBAM.maxPlot": 10,
	"variantCallingONT.CALLVARBAM.minCoverage": 4,
	"variantCallingONT.CALLVARBAM.outputForEnsemble": false,
	"variantCallingONT.CALLVARBAM.parallelLevel": 2,
	"variantCallingONT.CALLVARBAM.path_exe": "clair.py",
	"variantCallingONT.CALLVARBAM.pypy": "pypy",
	"variantCallingONT.CALLVARBAM.pysamForAllIndelBases": false,
	"variantCallingONT.CALLVARBAM.samtools": "samtools",
	"variantCallingONT.CALLVARBAM.stopConsiderLeftEdge": false,
	"variantCallingONT.CALLVARBAM.subString": "(.bam)",
	"variantCallingONT.CALLVARBAM.subStringReplace": "",
	"variantCallingONT.CALLVARBAM.threshold": 0.125,
	"variantCallingONT.CALLVARBAM.workers": 8,
	"variantCallingONT.CALLVARBAM.threads": 1,
	"variantCallingONT.CALLVARBAM.memoryByThreads": 768,
	"variantCallingONT.CONCATENATEFILES.subString": "^[0-9]+-",
	"variantCallingONT.CONCATENATEFILES.threads": 1,
	"variantCallingONT.CONCATENATEFILES.memoryByThreads": 768,
	"variantCallingONT.FAI2BED.subString": ".?(fa)?(sta)?.fai$",
	"variantCallingONT.FAI2BED.subStringReplace": ".bed",
	"variantCallingONT.FAI2BED.threads": 1,
	"variantCallingONT.FAI2BED.memoryByThreads": 768,
	"variantCallingONT.FINDFILES.threads": 1,
	"variantCallingONT.FINDFILES.memoryByThreads": 768,
	"variantCallingONT.GATHERVCFFILES.path_exe": "gatk",
	"variantCallingONT.GATHERVCFFILES.subStringReplace": ".gather",
	"variantCallingONT.GATHERVCFFILES.reorder": true,
	"variantCallingONT.GATHERVCFFILES.threads": 1,
	"variantCallingONT.GATHERVCFFILES.memoryByThreads": 768,
	"variantCallingONT.INDEX.path_exe": "sambamba",
	"variantCallingONT.INDEX.checkBins": false,
	"variantCallingONT.INDEX.threads": 1,
	"variantCallingONT.INDEX.memoryByThreads": 768,
	"variantCallingONT.MAPONT.path_exe": "minimap2",
	"variantCallingONT.MAPONT.path_exe_samtools": "samtools",
	"variantCallingONT.MAPONT.CIGAROperator": false,
	"variantCallingONT.MAPONT.KmerSize": 15,
	"variantCallingONT.MAPONT.MDtag": false,
	"variantCallingONT.MAPONT.SAMoutput": true,
	"variantCallingONT.MAPONT.ZDropScore1": 400,
	"variantCallingONT.MAPONT.ZDropScore2": 200,
	"variantCallingONT.MAPONT.filterOutFracMin": 2.0E-4,
	"variantCallingONT.MAPONT.finGTAG": "n",
	"variantCallingONT.MAPONT.gapExtension1": 2,
	"variantCallingONT.MAPONT.gapExtension2": 1,
	"variantCallingONT.MAPONT.gapPenalty1": 4,
	"variantCallingONT.MAPONT.gapPenalty2": 24,
	"variantCallingONT.MAPONT.homopolymerCompressed": false,
	"variantCallingONT.MAPONT.matchingScore": 2,
	"variantCallingONT.MAPONT.maxIntronLen": 200000,
	"variantCallingONT.MAPONT.minChainScore": 40,
	"variantCallingONT.MAPONT.minMinimizerChain": 3,
	"variantCallingONT.MAPONT.minPeakDP": 80,
	"variantCallingONT.MAPONT.minSec2Prim": 0.8,
	"variantCallingONT.MAPONT.minWindowSize": 10,
	"variantCallingONT.MAPONT.miniBatch": 500000000,
	"variantCallingONT.MAPONT.mismatchPenalty": 4,
	"variantCallingONT.MAPONT.platformReads": "ONT",
	"variantCallingONT.MAPONT.retainSec": 5,
	"variantCallingONT.MAPONT.splitIndex": "4G",
	"variantCallingONT.MAPONT.stopChain": 5000,
	"variantCallingONT.MAPONT.subString": ".(fastq|fq)(.gz)?",
	"variantCallingONT.MAPONT.subStringReplace": "",
	"variantCallingONT.MAPONT.useSoftClipping": false,
	"variantCallingONT.MAPONT.writeCIGARSup65535": false,
	"variantCallingONT.MAPONT.threads": 1,
	"variantCallingONT.MAPONT.memoryByThreads": 768,

	"variantCallingONT.CALLVARBAM.bedRegions": "File? (optional)",
	"variantCallingONT.CALLVARBAM.candidateVcf": "File? (optional)",
	"variantCallingONT.CALLVARBAM.logPath": "String? (optional)",
	"variantCallingONT.FAI2BED.name": "String? (optional)",
	"variantCallingONT.FAI2BED.outputPath": "String? (optional)",
	"variantCallingONT.FINDFILES.executable": "Boolean? (optional)",
	"variantCallingONT.FINDFILES.gid": "Int? (optional)",
	"variantCallingONT.FINDFILES.minDepth": "Int? (optional)",
	"variantCallingONT.FINDFILES.readable": "Boolean? (optional)",
	"variantCallingONT.FINDFILES.regexpPath": "String? (optional)",
	"variantCallingONT.FINDFILES.uid": "Int? (optional)",
	"variantCallingONT.FINDFILES.writable": "Boolean? (optional)",
	"variantCallingONT.GATHERVCFFILES.name": "String? (optional)",
	"variantCallingONT.INDEX.sample": "String? (optional)",
	"variantCallingONT.MAPONT.csShort": "Boolean? (optional)",
	"variantCallingONT.MAPONT.dumpIndexFile": "File? (optional)"
}
