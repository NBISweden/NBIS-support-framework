# Report templates

This is the `report` directory, in which templates for NBIS reports can be
found. While the exact structure and means of creation of these reports do not
have to conform to a specific standard, there is some [required information]
[report-info] that has to be included.

## Included templates

**knitr-PDF** \
`knitr-pdf/report.Rnw` is a Sweave file, *i.e.* a mix between R and LaTeX, and
can easily to compiled into a nice-looking PDF document using [knitr]
[knitr-home]. It contains several shorthand commands in the beginning of the
document, which by default contain mock names and e-mails. These should be
changed prior to compilation:

```tex
# Default (mock) command
\newcommand{\staffName}{Supp Ortstaff}

# Useful command
\newcommand{\staffName}{Erik Fasterius}
```

The `knitr-pdf/report.Rnw` file can be compiled using the `knit2pdf` function
R, either from inside R or from the command line, like so:

```bash
Rscript -e 'knitr::knit2pdf("report.Rnw")'
```

## Common files

Some files common to all templates are also included, such as NBIS and SciLife
logos (`logos`), a test bibliography (`references.bib`) and a custom LaTeX
bibliography-style (`myunstr.bst`).

[*(back to project home directory)*][sf-home]

[knitr-home]: https://yihui.name/knitr/
[report-info]: https://github.com/NBISweden/NBIS-template-support-reports
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
