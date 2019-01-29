import glob

# Get all first-pair FASTQ files in the fastq data directory
FASTQ_DIR = "data/example_data/fastq/"
fastq_files = glob.glob(FASTQ_DIR + "*.fastq.gz")
fastq_files = [s.replace('.fastq.gz', '') for s in fastq_files]
fastq_files = [s.replace(FASTQ_DIR, '') for s in fastq_files]

# Rule: final output and cleanup
rule all:
    input:
        "results/qc/multiqc_report.html"

# Rule: running FastQC
rule FastQC:
    input:
        "data/example_data/fastq/{fastq}.fastq.gz"
    output:
        "results/qc/01-FASTQ/{fastq}_fastqc.html",
        "results/qc/01-FASTQ/{fastq}_fastqc.zip"
    log:
        "results/logs/log.{fastq}.FastQC.txt"
    shell:
        """
        fastqc {input} -o results/qc/01-FASTQ/ \
            > {log} 2>&1
        """

# Rule: collate MultiQC report
rule MultiQC:
    input:
        expand("results/qc/01-FASTQ/{fastq}_fastqc.zip", fastq=fastq_files)
    output:
        "results/qc/multiqc_report.html"
    log:
        "results/logs/log.MultiQC.txt"
    shell:
        """
        multiqc results/qc -o results/qc --no-data-dir \
            > {log} 2>&1
        """
