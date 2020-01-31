# Pipelines

# Table of Contents

* [Foreword](#foreword)
* [Pipelines](#pipelines)
  * [Plan to develop a new pipeline?](#plan-to-develop-a-new-pipeline)
  * [Pipelines per workflow](#pipelines-per-workflow)
     * [Bash](#bash)
     * [Bpipe](#bpipe)
     * [Snakemake](#snakemake)
     * [Nextflow](#nextflow)
  * [Pipelines per subject](#pipelines-per-subject)
     * [Metagenomics](#metagenomics)
     * [Single-cell](#single-cell)
     * [Variant analysis](#variant-analysis)
     * [Transcriptome assembly](#transcriptome-assembly)
     * [Functional annotation](#functional-annotation)
     * [Related to genome annotation](#related-to-genome-annotation)
* [About pipelines frameworks](#about-pipelines-frameworks)
  * [List of pipeline frameworks](#list-of-pipeline-frameworks)
  * [Pipelines comparison](#pipelines-comparison)

# Foreword

This is the `pipelines` directory, which aims to list and include bioinformatic pipelines used within NBIS. Some pipelines are created within NBIS for internal use, while others originate from outside. Not all pipelines are useful for
all projects, but this list may at least be a good starting point to see if
your project might be able to use something that already exists. If you feel
that a pipeline is missing, please add it!

We don't approach tools here because so numerous exist. We advise to use as most as possible tools available into [conda](https://anaconda.org), we emphase the tools developed at [SciLifeLab][slopen] and at [NBIS][nbis_tools], and promote the use of [bio.tools](https://bio.tools) for searching existing tools.

# Pipelines

## Plan to develop a new pipeline?

NBIS has currently two repositories for easy development of pipelines. They are modules based,
which means each module is dedicated for one task. Modules can be picked and connected to each other at your convenience to create complex workflows.

  * for *nextflow* pipelines see [pipelines-nextflow][nbis_nextflow].
  * for *bpipe* pipelines see [pipelines-bpipe][nbis_bpipe].
  * for *snakemake* -- TO DO --

## Pipelines per workflow

### Bash

 * [Sauron][lts-sauron]: a workflow for running analyses on single-cell
   RNA-seq count data
   
### Bpipe

 * [GAAS bpipe][nbis_bpipe]: a *bpipe* pipeline collection for various annotation tasks

### Nextflow

 * [GAAS nextflow][nbis_nextflow]: a *nextflow* pipeline collection for various annotation tasks
 * [Sarek][sarek]: a pipeline for detecting germline or somatic variants from
   whole genome or targeted sequencing
 * [nf-core][nfcore]: a pipeline collection including everything from basic
   analysis of bulk RNA-seq data to workflows for bisulfite sequencing and
   using Google's DeepVariant

### Snakemake

 * [NBIS-MAGS][nbis-mags]: analyses of individual microbial genomes such as
   *metagenome assembled genomes* or *single amplified genomes*
 * [NBIS-Metagenomics][nbis-meta]: a workflow for metagenomic projects
 * [NBIS-MAGS][nbis-mags]: analyses of individual microbial genomes such as
   *metagenome assembled genomes* or *single amplified genomes*
 * [NBIS-Metagenomics][nbis-meta]: a workflow for metagenomic projects
 * [LTS-scRNA-seq][lts-scrnaseq]: a pipeline for running alignment, read
   counting and quality controls for single-cell RNA-seq data

## Pipelines per subject

### Metagenomics

 * [NBIS-MAGS][nbis-mags]: analyses of individual microbial genomes such as
   *metagenome assembled genomes* or *single amplified genomes*
 * [NBIS-Metagenomics][nbis-meta]: a workflow for metagenomic projects

### Single-cell

 * [LTS-scRNA-seq][lts-scrnaseq]: a pipeline for running alignment, read
   counting and quality controls for single-cell RNA-seq data
 * [Sauron][lts-sauron]: a workflow for running analyses on single-cell
   RNA-seq count data

### Variant analysis

 * [Sarek][sarek]: a pipeline for detecting germline or somatic variants from
   whole genome or targeted sequencing

### Transcriptome assembly

 * see among [GAAS nextflow][nbis_nextflow]
 * see among [GAAS bpipe][nbis_bpipe]
 
### Functional annotation

 * see among [GAAS nextflow][nbis_nextflow]
 * see among [GAAS bpipe][nbis_bpipe]

### Related to genome annotation

 * see among [GAAS nextflow][nbis_nextflow]
 * see among [GAAS bpipe][nbis_bpipe]


# About pipelines frameworks

## List of pipeline frameworks

 * [https://github.com/pditommaso/awesome-pipeline](https://github.com/pditommaso/awesome-pipeline)
 * [https://github.com/common-workflow-language/common-workflow-language/wiki/Existing-Workflow-systems](https://github.com/common-workflow-language/common-workflow-language/wiki/Existing-Workflow-systems)
 * [https://www.biostars.org/p/91301/](https://www.biostars.org/p/91301/)

## Pipelines comparison

 * [Di Tommaso, P. et al. Nextflow enables reproducible computational workflows. Nat. Biotechnol. 35, 316–319 (2017)](https://www.nature.com/articles/nbt.3820/tables/1)
 * [Leipzig J. A review of bioinformatic pipeline frameworks Brief. Bioinform. (2016)](https://academic.oup.com/bib/article/18/3/530/2562749)




[*(back to project home directory)*][sf-home]

[nbis_bpipe]: https://github.com/NBISweden/pipelines-bpipe
[nbis_nextflow]: https://github.com/NBISweden/pipelines-nextflow
[lts-sauron]: https://bitbucket.org/scilifelab-lts/sauron/src/seurat3/
[lts-scrnaseq]: https://bitbucket.org/scilifelab-lts/lts-workflows-sm-scrnaseq/src/master/
[nbis-mags]: https://bitbucket.org/scilifelab-lts/nbis-mags/src/master/
[nbis-meta]: https://bitbucket.org/scilifelab-lts/nbis-meta/src/master/
[nfcore]: https://nf-co.re/
[sarek]: https://github.com/SciLifeLab/Sarek
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
[slopen]: https://opensource.scilifelab.se/
[nbis_tools]: https://nbis.se/infrastructure/tools/
