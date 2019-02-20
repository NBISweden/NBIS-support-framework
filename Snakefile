import glob

# Config file
configfile: "config.yml"

# Paths
datadir = config["datadir"]
fastqcdir = config["fastqcdir"]
aligndir = config["aligndir"]
rseqcdir = config["rseqcdir"]
multiqcdir = config["multiqcdir"]

# Get all first-pair FASTQ files in the fastq data directory
fastq_files = glob.glob(datadir + "*.fastq.gz")
fastq_files = [s.replace('.fastq.gz', '') for s in fastq_files]
fastq_files = [s.replace(datadir, '') for s in fastq_files]

# Get sample names
samples = [s.replace('_1', '') for s in fastq_files]
samples = [s.replace('_2', '') for s in samples]
fastq_samples = samples
samples = list(set(samples))

# Include external rules
include: "rules/FastQC.smk"
include: "rules/STAR-PE.smk"
include: "rules/RSeqC.smk"

# Rule: final output and cleanup
rule all:
    input:
        multiqcdir + "multiqc_report.html"

# Rule: collate MultiQC report
rule MultiQC:
    input:
        expand(fastqcdir + "{fastq}_fastqc.zip", zip, sample=fastq_samples, fastq=fastq_files),
        expand(aligndir + "{sample}/{sample}.bam", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.bam_stat.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.geneBodyCoverage.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.inner_distance.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.infer_experiment.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.junction_saturation.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.read_distribution.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.tin.xls", sample=samples)
    output:
        multiqcdir + "multiqc_report.html"
    log:
        multiqcdir + "log.multiqc.txt"
    shell:
        """
        multiqc results \
            --outdir $(dirname {output}) \
            --ignore *_STAR* \
            --force \
                > {log} 2>&1
        """
