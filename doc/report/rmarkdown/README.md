# RMarkdown

`rmarkdown/report.Rmd` is a RMarkdown file, a mix between R and rmarkdown,
which  can easily to compiled into a nice-looking HTML document using
[rmarkdown][rmarkdown-home]. It contains several parameters in the YAML header
of the document, which by default contain mock names and e-mails. These should
be changed prior to compilation.

```yaml
# Default (mock) parameter
params:
    staff_name: Supp Ortstaff

# Useful parameter 
params:
    staff_name: Erik Fasterius 
```

The `rmarkdown/report.Rmd` file can be compiled using the `rmarkdown::render`
function, either from inside R or from the command line, like so:

```bash
Rscript -e 'rmarkdown::render("report.Rmd")'
```

A HTML of the default, unedited report template is also provided, as an
example.

[*(back to project home directory)*][sf-home]

[rmarkdown-home]: https://rmarkdown.rstudio.com/
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
