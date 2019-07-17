# Pipelines 

This is the `pipelines` directory, in which bioinformatic analytical pipelines
reside in a modularised manner. Not all pipelines will be useful for all NBIS
support projects, but the idea is to have pipelines for many of the
routine-tasks that are commonly performed in many projects, such as read
alignment and quality controls for RNA-seq projects. Additional pipelines can
then be added as the need arises, facilitating repeated analyses and general
scientific reproducibility.

## Included pipelines 

[**RNA-seq**][sf-rnaseq] \
This is a standard RNA-seq pipeline written in snakemake, which includes
alignment, gene counting and quality controls using well-characterised and
common RNA-seq software packages.

[*(back to project home directory)*][sf-home]

[fastqc-home]: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
[rseqc-home]: http://rseqc.sourceforge.net/
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
[sf-rnaseq]: https://github.com/NBISweden/NBIS-support-framework/tree/master/pipelines/RNA-seq
[star-home]: https://github.com/alexdobin/STAR
