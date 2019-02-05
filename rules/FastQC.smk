# Rule: running FastQC
rule FastQC:
    input:
        "data/example_data/fastq/{fastq}.fastq.gz"
    output:
        "results/qc/fastqc/{fastq}_fastqc.html",
        "results/qc/fastqc/{fastq}_fastqc.zip"
    log:
        "results/logs/log.{fastq}.FastQC.txt"
    shell:
        """
        fastqc {input} -o results/qc/fastqc/ \
            > {log} 2>&1
        """
