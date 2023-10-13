# Report templates

This is the `report` directory, in which templates for NBIS reports can be
found. While the exact structure and means of creation of these reports do not
have to conform to a specific standard, there is some [required
information][report-info] that has to be included.

## Included templates

**Sweave** \
`sweave/report.Rnw` is a Sweave file, a mix between R and LaTeX, and
can easily to compiled into a nice-looking PDF document.

**RMarkdown** \
`rmarkdown/report.Rmd` is a RMarkdown file, a mix between R and markdown, which
can easily to compiled into a nice-looking HTML document.

## Common files

Some files common to all templates are also included in the `common` directory,
such as NBIS and SciLife logos (`logos`), a test bibliography
(`references.bib`) and a custom LaTeX bibliography-style (`myunstr.bst`).

## Adding templates

If you want a different template that the ones already provided here, please do
contribute a new one! Simply create a new directory with a descriptive name,
in which you include the template itself and its output (*i.e.* a PDF, HTML,
*etc.*), as well as add any required software packages to the NBIS-SF Conda
`environment.yml` file. Also include a `README.md` in the template directory,
specifying how the report should be used. Depending on your file formats you
may also need to edit the `.gitignore` file.

[*(back to project home directory)*][sf-home]

[knitr-home]: https://yihui.name/knitr/
[report-info]: https://github.com/NBISweden/NBIS-template-support-reports
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
