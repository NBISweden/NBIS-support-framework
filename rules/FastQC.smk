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
