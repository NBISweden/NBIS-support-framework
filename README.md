# NBIS Support Framework

## Introduction

The NBIS Support Framework (NBIS-SF) is about creating a collaborative framework
for NBIS support projects and the related data management plans. The idea is to
have a common framework and knowledge-base that NBIS experts may choose to adopt
and expand as they perform support-related work. This includes tools for
reproducibility (*e.g.* Conda, Snakemake, Docker), version control (git,
GitHub), [report templates](doc/report/) (*e.g.* RMarkdown, LaTeX, KnitR, Jupyter)
and support-related information ([data management guidelines](
doc/data-management/), consultation guidelines, contract templates, *etc.*).
NBIS also has a separate repository for pipelines, which you can find at
[NBISweden/pipelines][nbis-pipelines].

You can find more complete examples and inspiration of how to work reproducibly
in NBIS support work at the following places:
 * [Mahesh's NBIS project template](https://github.com/mahesh-panchal/NBIS_project_template)
 * [Erik's NBIS project template](https://github.com/fasterius/nbis-support-template)
 * [Roy's R Markdown templates](https://github.com/royfrancis/minty)
 * [Erik's NBIS Quarto template](https://github.com/NBISweden/nbis-templates-quarto)
 * [Rasmus' project template](https://github.com/NBISweden/project_template)
 * [Cookiecutter Data Science](http://drivendata.github.io/cookiecutter-data-science/)

## Setup

First create a new repository for your project by using NBIS-SF as a template.
You can do this directly from the NBIS-SF GitHub by pressing the *"Use this
template"* button and select *"Create new repository"*. This will take you through 
the creation of your new repo like normal, but it will contain all the content currently 
available on NBIS-SF in a single, initial commit. Set the *Owner* to 
[NBISweden](https://github.com/NBISweden/).

### Naming the repository

- For *user-fee projects*, name your new repository with _NBIS_, the Redmine issue number, 
the year, plus a descriptive name, *e.g.* *NBIS-4412-18-mast*. You can then clone your new repository like you would normally.

- For *peer-review projects*, name your new repository with _NBIS_ followed by the WABI ID of
the project. The WABI ID is comprised of the PI's first name initial(s), the PI's surname, 
and the year and month (YYMM) of the application deadline. For example: _NBIS-M\_Bergö\_1305_

> **Note**
If you don't know the WABI ID for the project, you can ask your manager or search for the 
project in Redmine. The Redmine issue for the project should have a field "WABI ID" containing 
the ID. 

## Repo privacy settings

By default repositories are public, meaning they are accessible to anyone on the
Internet. In case, you want to restrict access to the repo to inside NBIS only:

* While creating repo choose "Private"
* Go to repository "Settings" -> "Collaborators and Teams" -> search field in
  "Manage Access" and type "Staff"
* Give appropriate access to "Staff" team (Read, Write, Triage etc.) and voilá,
  now all at NBIS have access

## Contributing

All contributions are welcome, small and large! The central idea behind NBIS-SF
is to develop an up-to-date framework for NBIS support projects, to share
knowledge and to streamline common bioinformatics tasks. Anybody working at
NBIS is welcome to contribute! If you want to contribute something, please see
the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Questions and feedback can be sent to
[Erik Fasterius](mailto:erik.fasterius@nbis.se?subject=[NBIS-SF]),
[Olga Dethlefsen](mailto:olga.dethlefsen@nbis.se?subject=[NBIS-SF]) or
[John Sundh](mailto:john.sundh@nbis.se?subject=[NBIS-SF]).


[nbisweden]: https://github.com/NBISweden
[nbis-pipelines]: https://github.com/NBISweden/pipelines/
