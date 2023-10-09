# Sweave

`sweave/report.Rnw` is a Sweave file, *i.e.* a mix between R and LaTeX, and
can easily to compiled into a nice-looking PDF document using
[knitr][knitr-home]. It contains several shorthand commands in the beginning of
the document, which by default contain mock names and e-mails. These should be
changed prior to compilation:

```tex
# Default (mock) command
\newcommand{\staffName}{Supp Ortstaff}

# Useful command
\newcommand{\staffName}{Erik Fasterius}
```

The `sweave/report.Rnw` file can be compiled using the `knit2pdf` function
R, either from inside R or from the command line, like so:

```bash
Rscript -e 'knitr::knit2pdf("report.Rnw")'
```

This will also create an intermediate `.tex` file, which can be deleted after a
successful compilation. A PDF of the default, unedited report template is also
provided, as an example.

[*(back to project home directory)*][sf-home]

[knitr-home]: https://yihui.name/knitr/
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
