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
 * [Workflows and pipelines][sf-pipelines]
 * [Data management][sf-dmp] and [administrative matters][sf-admin]

## Setup

**Create a project repo at NBISweden** \
First create an empty GitHub repository that you wish to work on. If a Redmine
issue is available for the project, name the repo with the issue number, year,
plus a descriptive name and on the [NBISweden GitHub][nbissweden], *e.g.*
*4412-18-mast* or *3939-20-ctcf*.

**Copy the NBIS-SF repository to your new project repo** \
The next step is to clone the original NBIS-SF, followed by changing the remote
URL to your new NBISweden GitHub address.

```bash
# Clone the repo into a new project folder
git clone https://github.com/NBISweden/NBIS-support-framework <project-folder>
cd <project-folder>

# Change the remote location and push
git remote set-url origin <new-repo-github-address>
git push origin master
```

## Contributing

All contributions are welcome, small and large! The central idea behind NBIS-SF
is to develop an up-to-date framework for NBIS support projects, to share
knowledge and to streamline common bioinformatics tasks. Anybody working at
NBIS is welcome to contribute to the repo with their own templates, rules and
code. NBIS-SF should be modular, so that anybody can pick and choose among all
modules which are most appropriate for the project at hand. If you want to
contribute something, please see the [CONTRIBUTING.md][sf-contribute] file.

Questions and feedback can be sent to
[Erik Fasterius](mailto:erik.fasterius@nbis.se?subject=[NBIS-SF]) or
[Olga Dethlefsen](mailto:olga.dethlefsen@nbis.se?subject=[NBIS-SF]).

[nbissweden]: https://github.com/NBISweden
[sf-admin]: https://github.com/NBISweden/NBIS-support-framework/tree/master/admin
[sf-contribute]: https://github.com/NBISweden/NBIS-support-framework/blob/master/CONTRIBUTING.md
[sf-data]: https://github.com/NBISweden/NBIS-support-framework/tree/master/data
[sf-dmp]: https://github.com/NBISweden/NBIS-support-framework/tree/master/doc/data-management
[sf-pipelines]: https://github.com/NBISweden/NBIS-support-framework/tree/master/pipelines
[sf-report]: https://github.com/NBISweden/NBIS-support-framework/tree/master/reports
[sf-results]: https://github.com/NBISweden/NBIS-support-framework/tree/master/results
[sf-scratch]: https://github.com/NBISweden/NBIS-support-framework/tree/master/scratch
