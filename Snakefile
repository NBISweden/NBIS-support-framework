import glob

# Include external rules
include: "rules/FastQC.smk"
include: "rules/STAR_PE.smk"
include: "rules/RSeqC.smk"

# Config file
configfile: "config.yml"

# Get all first-pair FASTQ files in the fastq data directory
FASTQ_DIR = "data/example_data/fastq/"
fastq_files = glob.glob(FASTQ_DIR + "*.fastq.gz")
fastq_files = [s.replace('.fastq.gz', '') for s in fastq_files]
fastq_files = [s.replace(FASTQ_DIR, '') for s in fastq_files]

# Get sample names
samples = [s.replace('_1', '') for s in fastq_files]
samples = [s.replace('_2', '') for s in samples]
samples = list(set(samples))

# Rule: final output and cleanup
rule all:
    input:
        "results/qc/multiqc_report.html"

# Rule: collate MultiQC report
rule MultiQC:
    input:
        expand("results/bam/{sample}/{sample}.bam", sample=samples),
        expand("results/qc/fastqc/{fastq}_fastqc.zip", fastq=fastq_files),
        expand("results/qc/rseqc/{sample}.bam_stat.txt", sample=samples),
        expand("results/qc/rseqc/{sample}.geneBodyCoverage.txt", sample=samples),
        expand("results/qc/rseqc/{sample}.inner_distance.txt", sample=samples),
        expand("results/qc/rseqc/{sample}.infer_experiment.txt", sample=samples),
        expand("results/qc/rseqc/{sample}.junction_saturation.txt", sample=samples),
        expand("results/qc/rseqc/{sample}.read_distribution.txt", sample=samples)
    output:
        "results/qc/multiqc_report.html"
    log:
        "results/logs/log.MultiQC.txt"
    shell:
        """
        multiqc results \
            --ignore *_STAR* \
            --outdir results/qc \
            --no-data-dir \
                > {log} 2>&1
        """
