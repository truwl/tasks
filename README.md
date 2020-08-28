# MobiDL 2

MobiDL 2 is a collection of tools wrapped in WDL to be used in any WDL pipelines.

## __WARNING : BETA VERSION DO NOT USE IN PRODUCTION__

## Introduction

This repo provide a set of workflow in WDL (see [workflows](#workflows-implemented))
and a set of tools wrapped in WDL tasks (see [tools](#tools-implemented)).

The code follows WDL specifications as much as possible ([WDL-spec](https://github.com/openwdl/wdl/blob/main/versions/1.0/SPEC.md)).

## Todo list

- [ ] Make a test workflow
- [ ] Define structures for referenceGenome
	- [ ] Change in all task to use this structures
- [ ] Implement options for cluster

## Workflows implemented

### General

#### PrepareGenome

This workflow is developped to prepare a fasta file to be used into other
pipelines.

It will process the fasta input files to create indexes and dictionary.

### Panel capture

#### AlignDNAcapture

This workflow align DNA capture sequence against the reference genome.

It produce some quality metrics from different tools.

#### VariantCallingCaptureHC

This workflow apply variant calling by HaplotypeCaller on a capture sequencing.

It produce some quality metrics from different tools.

#### PanelCapture

This workflow call ***PrepareGenome*** if necessary then it calls the following
subworkflow:
	- ***AlignDNAcapture***
	- ***VariantCallingCaptureHC***

## Tools implemented

- bash :
	- findFiles
	- convertBedToIntervals
	- makeLink
	- concatenateFiles
- bgzip (v1.9)
	- bgzip (compress, decompress)
- bcftools (v1.9) :
	- index
	- merge
	- norm
	- stats
- bedtools (v2.29.2) :
	- intersect
	- sort
	- coverage
- BWA (0.7.17-r1188) :
	- mem
	- index
- Crumble (0.8.3) :
	- crumble
- dwgsim (0.1.11) :
	- simulateReadsIllumina
- FastQC (v0.11.9) :
	- fastqc
	- fastqcNano
	- fastqcCasava
- GATK4 (4.1.8.1) :
	- ApplyBQSR
	- BaseRecalibrator
	- BedToIntervalList
	- IntervalListToBed
	- HaplotypeCaller
	- CollectMultipleMetrics
	- GatherBamFiles
	- GatherBQSRReports
	- GatherVcfFiles
	- LeftAlignIndels
	- ReorderSam
	- DepthOfCoverage (BETA)
	- SplitIntervals
	- SplitVcfs
	- VariantFiltration
	- MergeVcfs
	- SortVcf
- Sambamba (0.6.6) :
	- index
	- flagstat
	- markdup
	- sort
	- view
- samtools (1.9) :
	- bedcov
	- index
	- flagstat
	- sort
	- dict
	- view
	- faidx
	- fqidx
	- markdup
	- fixmate
- Star :
	- genomeGenerate
- Qualimap (v.2.2.2-dev) :
	- bamqc
- tabix (1.9):
	- index
