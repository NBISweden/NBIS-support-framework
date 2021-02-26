# NBIS Support Framework

## Introduction

The NBIS Support Framework (NBIS-SF) is about creating a collaborative framework
for NBIS support projects and the related data management plans. The idea is to
have a common framework and knowledge-base that NBIS experts may choose to adopt
and expand as they perform support-related work. This includes tools for
reproducibility (*e.g.* Conda, Snakemake, Docker), version control (git,
GitHub), [report templates](reports/) (*e.g.* RMarkdown, LaTeX, KnitR, Jupyter)
and support-related information ([data management guidelines](
doc/data-management/), consultation guidelines, contract templates, *etc.*).
NBIS also has a separate repository for pipelines, which you can find at
[NBISweden/pipelines][nbis-pipelines].

## Setup

First create a new repository for your project by using NBIS-SF as a template.
You can do this directly from the NBIS-SF GitHub by pressing the *"Use this
template"* button. This will take you through the creation of your new repo
like normal, but it will contain all the content currently available on NBIS-SF
in a single, initial commit. Name your new repository with the type of project
it is (LTS, SMS or PP), the Redmine issue number, the year, plus a descriptive
name and on the [NBISweden GitHub][nbisweden], *e.g.* *SMS-4412-18-mast* or
*LTS-3939-20-ctcf*. You can then clone your new repository like you would
normally.

## Contributing

All contributions are welcome, small and large! The central idea behind NBIS-SF
is to develop an up-to-date framework for NBIS support projects, to share
knowledge and to streamline common bioinformatics tasks. Anybody working at
NBIS is welcome to contribute! If you want to contribute something, please see
the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Questions and feedback can be sent to
[Erik Fasterius](mailto:erik.fasterius@nbis.se?subject=[NBIS-SF]) or
[Olga Dethlefsen](mailto:olga.dethlefsen@nbis.se?subject=[NBIS-SF]).

[nbisweden]: https://github.com/NBISweden
[nbis-pipelines]: https://github.com/NBISweden/pipelines/
