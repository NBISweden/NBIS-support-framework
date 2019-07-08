# Rule: run FastQC
rule FastQC:
    input:
        datadir + "{sample}.fastq.gz"
    output:
        fastqcdir + "{sample}/{sample}_fastqc.zip"
    log:
        fastqcdir + "{sample}/log.{sample}.fastqc.txt"
    shell:
        """
        fastqc {input} -o $(dirname {output}) \
            > {log} 2>&1
        """
