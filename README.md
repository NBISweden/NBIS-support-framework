# NBIS Support Framework

## Introduction

The NBIS Support Framework (NBIS-SF) is about creating a collaborative
framework for NBIS support projects and the related data management plans. The
idea is to have a common framework and knowledge-base that NBIS experts may
choose to adopt and expand as they perform support-related work. This includes
tools for reproducibility (*e.g.* Conda, Snakemake), version control (git,
GitHub), templates for reports (*e.g.* RMarkdown, LaTeX, KnitR, Jupyter) and
support-related information (data management plans, consultation guidelines,
contract templates, *etc.*).

**Objectives:**
 * Facilitate reproducibility of bioinformatic analyses
 * Foster collaboration across support projects
 * Provide out-of-the-box tools for routine support-tasks
 * Provide information regarding data management and administrative matters

You can read more about the separate sections here:
 * [Raw data][sf-data] and [temporary files][sf-scratch]
 * [Report templates][sf-report]
 * [Results and analyses][sf-results]
 * [Workflows and Snakemake rules][sf-rules]
 * [Data management][sf-dmp] and [administrative matters][sf-admin]

## Setup

**Create a project repo at NBISweden** \
First create an empty GitHub repository that you wish to work on. If a Redmine
issue is available for the project, name the repo with the issue number, year,
plus a descriptive name and on the [NBISweden GitHub][nbissweden], *e.g.*
*4412-18-mast* or *3939-20-ctcf*.

**Mirror the NBIS-SF repository** \
The next step is to mirror the original NBIS-SF repository at your new project
location.

```bash
# Clone the original repo and mirror it to the new location
git clone --bare https://github.com/NBISweden/NBIS-support-framework
cd NBIS-support-framework
git push --mirror <new-repo-location>

# Clone the mirror and delete the original clone
cd ..
git clone <new-repo-location>
rm -rf NBIS-support-framwork
```

**Install the Conda environment** \
The last step is to install the Conda environment. The NBIS-SF contains a
Conda environment file with some of the more "standard" HTS-software packages,
such as `FastQC` and `samtools`. You can add more packages through `conda
install <package>` as you need them during the project's lifetime, or directly
add them to the `environment.yml` file before installation. Git is set
to ignore any directory ending in `-env`; only the `environment.yml` file is
needed to reproduce the workspace environment (given platform-specific caveats,
of course).

```bash
module load conda
conda env create --prefix <env-name> --file environment.yml
conda activate <env-name>
```

## Running with Snakemake

[Snakemake][snakemake-home] is a workflow management system which can easily be
run on Uppmax. A main file containing the overall workflow is provided in
`Snakefile`, and modularised rules can be found in the `rules/` directory. In
order to correctly run the workflow, there are a number of steps you need to
perform.

**Change the `config.yml` file** \
The first step is to change the paths and directories in the configuration
file. You should, for example, change the `datadir: "data/test-data/fastq"` to
point to wherever your raw FASTQ files are stored. You may also wish to change
the reference genome path, *i.e.* `REF: "..."` and `STAR_REF: "..."`.

**Configure the desired outputs** \
The second step is to edit the `Snakefile` to specify your desired outputs. The
simple pipeline provided out-of-the-box includes alignment with *STAR* (either
paired- or single-end data), quality controls of both raw and aligned data
(*FastQC* and *RSeqC*, respectively) and a *MultiQC* report of the QC data.
If you desire all of these outputs you do not need to change anything else.
If you only want some FASTQ quality metrics, however, you can change the
`MultiQC` rule, like so:

```python
rule MultiQC:
    input:
        expand(fastqcdir + "{fastq}_fastqc.zip", zip, sample=fastq_samples,
               fastq=fastq_files)
    output:
        ...
```

**Run the pipeline locally** \
If you want to run the pipeline locally, simply make sure you've activated the
Conda environment (`conda activate <env-name>`) and run `snakemake`. You
should, however, perform a dry-run with `snakemake -n` first, which allows you
to inspect what Snakemake will attempt to do for you.

**Run the pipeline on Uppmax** \
If you want to run the pipeline on the Uppmax cluster, you first need to change
the cluster configuration information. This includes things such as the account
to use when submitting to SLURM (*i.e.* change `account: 'snic2017-7-343'`) or
how many cores to use (`partition: 'devel'`). You can also add rule-specific
configurations:

```bash
STAR-PE:
    ntasks: 8
    time: '00:30:00'
```

You will then want to run a terminal session through *e.g.* `tmux`, because
Snakemake will continuously monitor the job queue and what parts of the
pipeline that have been successfully run. This can be run on the login-nodes,
however, making the final step of running the submission-wrapper easy:

```bash
tmux new
./submit-snakemake.sh
```

Questions can be sent to [Erik Fasterius](mailto:erik.fasterius@nbis.se?subject=[NBIS-SF])
or [Olga Dethlefsen](mailto:olga.dethlefsen@nbis.se?subject=[NBIS-SF]).

[conda-home]: https://conda.io/en/latest/
[conda-install]: https://conda.io/projects/conda/en/latest/user-guide/install/index.html
[nbissweden]: https://github.com/NBISweden
[sf-admin]: https://github.com/NBISweden/NBIS-support-framework/tree/master/admin
[sf-data]: https://github.com/NBISweden/NBIS-support-framework/tree/master/data
[sf-dmp]: https://github.com/NBISweden/NBIS-support-framework/tree/master/doc/data-management
[sf-report]: https://github.com/NBISweden/NBIS-support-framework/tree/master/reports
[sf-results]: https://github.com/NBISweden/NBIS-support-framework/tree/master/results
[sf-rules]: https://github.com/NBISweden/NBIS-support-framework/tree/master/rules
[sf-scratch]: https://github.com/NBISweden/NBIS-support-framework/tree/master/scratch
[snakemake-home]: https://snakemake.readthedocs.io/en/stable/
