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

### Set-up Github repo with Redmine issue number
Create an empty GitHub repository that you wish to work on. If a Redmine issue is available for the project, name the repo with the
Redmine issue number plus a descriptive name on the NBISweden GitHub, e.g. 4412-mast, 3939-ctcf.

### Mirror NBIS-SF

```bash
# Clone the original repo and create a mirror in a new one
git clone --bare https://github.com/NBISweden/NBIS-support-framework
cd NBIS-support-framework
git push --mirror <new-repo-location>

# Clone the mirror and delete the original clone
cd ..
git clone <new-repo-location>
rm -rf NBIS-support-framwork
```
### Install Conda environment
```bash
# Create and activate the Conda environment
module load conda
conda env create --prefix <env-name> --file environment.yml
conda activate <env-name>
```
Conda environment containing some of the more "standard" HTS-software packages
(such as `FastQC` and `samtools`) will then be created in the current
directory. You can add more packages through `conda install <package>` as
you need them during the project's lifetime. Git is set to ignore any directory
ending in `-env`; only the `environment.yml` file is needed to reproduce the
workspace environment (given platform-specific caveats, of course).

## Running with Snakemake

[Snakemake][snakemake-home] is a workflow management system which can easily be
run on Uppmax. A main file containing the overall workflow is provided in
`Snakefile`, and modularised rules can be found in the `rules/` directory.

## How to contribute?
Anybody employed at NBIS is welcome to contribute to this repo. The central idea behind this repo is to develop up-to-date support framework, to share know-how and streamline common bioinformatics tasks.

To contribute, create a new feature branch to work on. The `master` branch should always be deployable, and any new feature should ideally have been tested before its merging into master.

```bash
# Clone NBIS-SF
git clone https://github.com/NBISweden/NBIS-support-framework.git

# Checkout a new feature branch
git checkout -b <branch>

# Add to staging arena
git add *

# Commit when ready
git push origin <branch>

# Review your code on commits page (NBIS Github site).
# Create a merge request.
# Your team lead will review the code & merge it to the main branch
```



[conda-home]: https://conda.io/en/latest/
[conda-install]: https://conda.io/projects/conda/en/latest/user-guide/install/index.html
[sf-admin]: https://github.com/NBISweden/NBIS-support-framework/tree/master/admin
[sf-data]: https://github.com/NBISweden/NBIS-support-framework/tree/master/data
[sf-dmp]: https://github.com/NBISweden/NBIS-support-framework/tree/master/data/data_management
[sf-report]: https://github.com/NBISweden/NBIS-support-framework/tree/master/reports
[sf-results]: https://github.com/NBISweden/NBIS-support-framework/tree/master/results
[sf-rules]: https://github.com/NBISweden/NBIS-support-framework/tree/master/rules
[sf-scratch]: https://github.com/NBISweden/NBIS-support-framework/tree/master/scratch
[snakemake-home]: https://snakemake.readthedocs.io/en/stable/
