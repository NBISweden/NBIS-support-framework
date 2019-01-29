# A template for NBIS support projects

## Introduction

This is a template for Short-/Medium-term Support projects at NBIS, and is
intended to be a starting point for new projects. The structure is based on
[Conda][conda-home] and [Snakemake][snakemake-home], with the aim of both
increasing reproducibility and transparency as well as facilitating code re-use
and teamwork.

## Installation

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

[conda-home]: https://conda.io/en/latest/
[conda-install]: https://conda.io/projects/conda/en/latest/user-guide/install/index.html
[snakemake-home]: https://snakemake.readthedocs.io/en/stable/
