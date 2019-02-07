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

## Installation with Conda

A local [installation of Conda][conda-install] is required for the setup,
but is available as a module on Uppmax. The first step is to simply install
the required software packages through Conda using the supplied
`environment.yml` file in the repository, like so:

```bash
conda env create --prefix [env-name] --file environment.yml
```

... where the `[env-name]` could be the Redmine issue followed by `-env`, or
some other name you deem appropriate. A Conda environment containing some of
the more "standard" HTS-software packages (such as `FastQC` and `samtools`)
will then be created in the current directory, and can be activated through
`conda activate [env-name]`.

When you add more software to your environment as you perform more analyses,
you should update the `environment.yml` file to include them. If you want an
*exact* specification of your particular environment (which will most likely
not be sharable across platforms) you may do the following:

```bash
conda env export --prefix [env-name] > environment.yml
```

The git repository is set to ignore any directory ending in `-env`; only the
`environment.yml` file is needed to reproduce the workspace environment (given
platform-specific caveats, of course).


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
