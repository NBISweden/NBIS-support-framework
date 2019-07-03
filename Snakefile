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
include: "rules/MultiQC.smk"

# Rule: final output and cleanup
rule all:
    input:
        multiqcdir + "multiqc_report.html"
