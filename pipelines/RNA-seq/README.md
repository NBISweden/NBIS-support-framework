# A standard RNA-seq pipeline

This is the `RNA-seq` directory, in which a pipeline for performing standard
RNA-seq analyses resides. It contains a [Conda][conda-home] `environment.yml`
file for easy installation of all its dependencies, several modularised rules
in the `rules/` directory, a `Snakefile` for running the pipeline locally, the
`submit-snakemake.sh` wrapper script for submitting the pipeline to Uppmax,
a `cluster.yml` file for specifying [SLURM][slurm-home] options and, finally, a
`config.yml` file for specifying paths.

## Included rules

**FastQC.smk** \
This rule runs [FastQC][fastqc-home] on any FASTQ files in a given input
directory, defined in the `config.yml` file. The output directory is also
specified in the same config file, which is `results/fastqc/<sample>/` by
default.

**STAR-PE.smk / STAR-SE.smk** \
This rule runs [STAR][star-home] in 2-pass mode on paired- or single-end FASTQ
files given in the `config.yml` file, same as for the FastQC-rule; the output
is `results/star/<sample>/` by default.

**RSeqC.smk** \
This rule runs [RSeqC][rseqc-home] on aligned data in the `.bam` format,
such as out the output of the STAR-rule; the output is
`results/rseqc/<sample>/` by default.

**MultiQC.smk** \
This rule runs [MultiQC][mqc-home] and collects all the quality metrics from
the previous steps in this pipeline; the output is in `results/multiqc/` by
default.

## Environment setup
You can change the contents of the provided `environment.yml` file by opening
it and deleting/adding whatever software is needed for your particular project.
It lists all software and what they are used for, so that you may adapt it for
your specific needs. You can add more packages through `conda install <package`
as you need them during the project's lifetime, or directly add them to the
`environment.yml` file before installation. A local version of Conda and all
its packages are also kept on Bianca, allowing you to easily use Conda both
locally and anywhere on Uppmax.

```bash
module load conda
conda env create --prefix <env-name> --file environment.yml
conda activate <env-name>
```

Git is set to ignore any directory ending in `-env`; only the `environment.yml`
file is needed to reproduce the workspace environment (given platform-specific
caveats, of course).

## Running the pipeline 

[Snakemake][snakemake-home] is a workflow management system which can easily be
run on Uppmax. A main file containing the overall workflow is provided in
`Snakefile`, and modularised rules can be found in the `rules/` directory. In
order to correctly run the workflow, there are a number of steps you need to
perform.

**Change the `config.yml` file** \
The first step is to change the paths and directories in the configuration
file. You should, for example, change the `datadir: "data/test-data/fastq"` to
point to wherever your raw FASTQ files are stored. You may also wish to change
the index location(s) through either absolute paths or by using symbolic links 
(*e.g.* `REF: "data/idx/genome.fa"` or `STAR_REF: "data/idx/STARIndex/"`).

**Configure the desired outputs** \
The second step is to edit the `Snakefile` to specify your desired outputs. The
simple pipeline provided out-of-the-box includes alignment with *STAR* (either
paired- or single-end data), quality controls of both raw and aligned data
(*FastQC* and *RSeqC*, respectively) and a *MultiQC* report of the QC data.
If you desire all of these outputs you do not need to change anything else.
If you only want some FASTQ quality metrics, however, you can change the
`MultiQC` rule, like so:

```python
rule MultiQC:
    input:
        expand(fastqcdir + "{fastq}_fastqc.zip", zip, sample=fastq_samples,
               fastq=fastq_files)
    output:
        ...
```

**Run the pipeline locally** \
If you want to run the pipeline locally, simply make sure you've activated the
Conda environment (`conda activate <env-name>`) and run `snakemake`. You
should, however, perform a dry-run with `snakemake -n` first, which allows you
to inspect what Snakemake will attempt to do for you.

**Run the pipeline on Uppmax** \
If you want to run the pipeline on the Uppmax cluster, you first need to change
the cluster configuration information. This includes things such as the account
to use when submitting to SLURM (*i.e.* change `account: 'snic2017-7-343'`) or
how many cores to use (`partition: 'devel'`). You can also add rule-specific
configurations:

```bash
STAR-PE:
    ntasks: 8
    time: '00:30:00'
```

You will then want to run a terminal session through *e.g.* `tmux`, because
Snakemake will continuously monitor the job queue and what parts of the
pipeline that have been successfully run. This can be run on the login-nodes,
however, making the final step of running the submission-wrapper easy:

```bash
tmux new
./submit-snakemake.sh
```

[*(back to project home directory)*][sf-home]

[conda-home]: https://conda.io/en/latest/
[fastqc-home]: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
[mqc-home]: https://multiqc.info/
[rseqc-home]: http://rseqc.sourceforge.net/
[sf-home]: https://github.com/NBISweden/NBIS-support-framework
[slurm-home]: https://slurm.schedmd.com/documentation.html
[snakemake-home]: https://snakemake.readthedocs.io/en/stable/
[star-home]: https://github.com/alexdobin/STAR
