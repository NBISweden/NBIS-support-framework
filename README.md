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

First create an empty GitHub repository that you wish to work on, *e.g.* the
Redmine issue plus a descriptive name on the NBISweden GitHub. The following
steps mirrors NBIS-SF to the new repo and installs the Conda environment.

```bash
# Clone the original repo and create a mirror in a new one
git clone --bare https://github.com/NBISweden/NBIS-support-framework
cd NBIS-support-framework
git push --mirror <new-repo-location>

# Clone the mirror and delete the original clone
git clone <new-repo-location> ..
cd ../<new-repo>
rm -rf ../NBIS-support-framwork

# Create and activate the Conda environment
module load conda
conda env create --prefix <env-name> --file environment.yml
conda activate <env-name>
```
Conda environment containing some of the more "standard" HTS-software packages
(such as `FastQC` and `samtools`) will then be created in the current
directory. You can then add more packages through `conda install <package>` as
you need them during the project's lifetime. Git is set to ignore any directory
ending in `-env`; only the `environment.yml` file is needed to reproduce the
workspace environment (given platform-specific caveats, of course).

## Running with Snakemake

[Snakemake][snakemake-home] is a workflow management system which can easily be
run on Uppmax. A main file containing the overall workflow is provided in
`Snakefile`, and modularised rules can be found in the `rules/` directory.

## Contributing

Anybody employed at NBIS can contribute to this repository. Simply create a new
branch (`git checkout -b <branch>`) and work on your contribution on that
branch - the `master` branch should always be deployable, and any new feature
should ideally have been tested before its merging into master.

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
