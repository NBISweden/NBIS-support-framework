# Rule: run FastQC
rule FastQC:
    input:
        datadir + "{fastq}.fastq.gz"
    output:
        html = fastqcdir + "{fastq}_fastqc.html",
        data = fastqcdir + "{fastq}_fastqc.zip"
    log:
        fastqcdir + "log.{fastq}.fastqc.txt"
    shell:
        """
        fastqc {input} -o $(dirname {output.data}) \
            > {log} 2>&1
        """
