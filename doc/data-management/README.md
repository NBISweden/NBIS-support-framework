# Data management

**Introduction**
This is the `data-management` directory, containing information and guidelines
regarding data management and how to help clients plan for their data
acquisition and storage.

A light version document is created based on work-in-progress DMPs, incl.
- [Data Management Plan][nbis-dmp], created by Niclas Jareborg, Yvonne Kallberg, Hanna Kultima
- [Data Management Guidelines][nbis-dmp-guidelines], created by Björn Nystedt, Niclas Jareborg, Markus (?)  

**Suggested usage**
- take DMP.pdf to the first meeting with the group to discuss DMPs
- together with the group prepare DMP for the project
  - make a copy of DMP.md, e.g. DMP-4412-19-mast.md
  - if the group can use .md, share the DMP.md and ask to answer the questions under each section
  - otherwise, help the group to fill in the information
  - compile to .pdf

**How to compile to pdf**

Command line:
- requires [Pandoc](https://pandoc.org/installing.html) & [R](https://www.r-project.org)
```bash
Rscript -e `library(rmarkdown); rmarkdown::render("DMP.Rmd", "pdf_document")`
```

R-studio:
- open DMP.Rmd
- set directory to the folder with DMP.Rmd
- press `knitr` button

**TODO:**
- get feedback and improve DMP-light version
- to get feedback / ideas on how to use DMP-light version in the best way, both for groups and for experts

**Thoughts to discuss**
- how DMP-light version should be used, e.g. emailed to the groups before consultation / first support meeting, filled together with experts during the meeting?
- how the DMP information should be collected, stored and shared with and within NBIS?
- should we prepare one or more examples with a common set-up?
- create a more practical version, from life scientist's point of view?  from experts' point of view?
- how to prepare DMP so it makes daily bioinformatics work easy? e.g. including pathways to data on Uppmax, specifying metadata formats and file sharing standards with NBIS?


[*(back to project home directory)*][sf-home]

[nbis-dmp]: https://docs.google.com/document/d/1g6vJNIrkSnylASkNHB9Zwm5N6jvTgoSxBjS_bexRPsY/edit#heading=h.p4d6md2nnd0i

[nbis-dmp-guidelines]: https://docs.google.com/document/d/1gotMFF7R02dEEnzoVaEtxoSzUD2QuVlkwuDbzRGulWw/edit#

[sf-home]: https://github.com/NBISweden/NBIS-support-framework
