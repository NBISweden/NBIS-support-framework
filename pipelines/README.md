# Pipelines

# Table of Contents

* [Foreword](#foreword)
* [Pipelines](#pipelines)
  * [Pipelines per workflow](#pipelines-per-workflow)
     * [Bpipe](#bpipe)
     * [Snakemake](#snakemake)
     * [Nextflow](#nextflow)
  * [Pipelines per subject](#pipelines-per-subject)
     * [General tools](#general-tools)
     * [Metagenomics](#metagenomics)
     * [Single-cell](#single-cell)
     * [Variant analysis](#variant-analysis)

# Foreword

This is the `pipelines` directory, which aims to list and include bioinformatic pipelines used within NBIS. Some pipelines are created within NBIS for internal use, while others originate from outside. Not all pipelines are useful for
all projects, but this list may at least be a good starting point to see if
your project might be able to use something that already exists. If you feel
that a pipeline is missing, please add it!

We don't approach tools here because so numerous exist. We advise to use as most as possible tools available into [conda](https://anaconda.org), we emphase the tools developed at [SciLifeLab][slopen] and at [NBIS][nbistools], and promote the use of [bio.tools](https://bio.tools) for searching existing tools.

# Pipelines

## Pipelines per workflow

### Bpipe

 * [bpipe][bpipe]: a *bpipe* pipeline collection for various everyday
   bioinformatic tasks

### Snakemake

   

### Nextflow

 * [nf-core][nfcore]: a pipeline collection including everything from basic
   analysis of bulk RNA-seq data to workflows for bisulfite sequencing and
   using Google's DeepVariant

## Pipelines per subject

### General tools

 * [MultiQC][multiqc]: a tool for aggregating bioinformatics results across
   many samples into a single report
 * [Cutadapt][cutadapt]: a tool for finding and removing adapter sequences,
   primers, poly-A tails and other types of unwanted sequences from HTS reads

### Metagenomics

 * [NBIS-MAGS][nbis-mags]: analyses of individual microbial genomes such as
   *metagenome assembled genomes* or *single amplified genomes*
 * [NBIS-Metagenomics][nbis-meta]: a workflow for metagenomic projects

### Single-cell

 * [LTS-scRNA-seq][lts-scrnaseq]: a pipeline for running alignment, read
   counting and quality controls for single-cell RNA-seq data
 * [Sauron][lts-sauron]: a workflow for running analyses on single-cell
   RNA-seq count data

## Variant analysis

 * [Sarek][sarek]: a pipeline for detecting germline or somatic variants from
   whole genome or targeted sequencing
 * [seqCAT][seqcat]: a Bioconductor R-package for analysing single nucleotide
   variants


[*(back to project home directory)*][sf-home]

[bpipe]: https://github.com/NBISweden/pipelines
[cutadapt]: https://github.com/marcelm/cutadapt/
[lts-sauron]: https://bitbucket.org/scilifelab-lts/sauron/src/seurat3/
[lts-scrnaseq]: https://bitbucket.org/scilifelab-lts/lts-workflows-sm-scrnaseq/src/master/
[multiqc]: https://github.com/ewels/MultiQC
[nbis-mags]: https://bitbucket.org/scilifelab-lts/nbis-mags/src/master/
[nbis-meta]: https://bitbucket.org/scilifelab-lts/nbis-meta/src/master/
[nfcore]: https://nf-co.re/
[sarek]: https://github.com/SciLifeLab/Sarek
[seqcat]: https://bioconductor.org/packages/release/bioc/html/seqCAT.html
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
[sf-rnaseq]: https://github.com/NBISweden/NBIS-support-framework/tree/master/pipelines/RNA-seq
[slopen]: https://opensource.scilifelab.se/
[nbistools]: https://nbis.se/infrastructure/tools/
