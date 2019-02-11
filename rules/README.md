# Snakemake rules

This is the `rules` directory, in which Snakemake rules reside in a modularised
manner. Not all rules will be useful for all NBIS support projects, but the
idea is to have rules for many of the routine-tasks that are commonly performed
in many projects, such as read alignment and quality controls. Additional rules
can then be added as the need arises, facilitating repeated analyses and
general scientific reproducibility.

## Included rules

**FastQC.smk** \
This rule runs [FastQC][fastqc-home] on any FASTQ files in a given input
directory, defined in the `config.yml` file. The output directory is also
specified in the same config file, which is `results/fastqc/<sample>/` by
default.

**STAR\_PE.smk / STAR\_SE.smk** \
This rule runs [STAR][star-home] in 2-pass mode on paired- or single-end FASTQ
files given in the `config.yml` file, same as for the FastQC-rule; the output
is `results/star/<sample>/` by default.

**RSeqC.smk** \
This rules runs [RSeqC][rseqc-home] on aligned data in the `.bam` format,
such as out the output of the STAR-rule; the output is
`results/rseqc/<sample>/` by default.

[*(back to project home directory)*][sf-home]

[fastqc-home]: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
[rseqc-home]: http://rseqc.sourceforge.net/
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
[star-home]: https://github.com/alexdobin/STAR
