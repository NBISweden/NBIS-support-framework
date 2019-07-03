# Rule: collate MultiQC report
rule MultiQC:
    input:
        expand(fastqcdir + "{sample}/{fastq}_fastqc.zip", zip, sample=fastq_samples, fastq=fastq_files),
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
