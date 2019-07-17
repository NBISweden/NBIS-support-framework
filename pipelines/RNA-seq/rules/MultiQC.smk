# Rule: collate MultiQC report
rule MultiQC:
    input:
        expand(fastqcdir + "{fastq}/{fastq}_fastqc.zip", fastq=fastq_files),
        expand(sortmernadir + "stats.{fastq}.txt", fastq=fastq_files),
        expand(aligndir + "{sample}/{sample}.bam", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.bam_stat.txt", sample=samples),
        expand(rseqcdir + "{sample}/{sample}.geneBodyCoverage.txt",
               sample=samples),
        expand(rseqcdir + "{sample}/{sample}.inner_distance.txt",
               sample=samples),
        expand(rseqcdir + "{sample}/{sample}.infer_experiment.txt",
               sample=samples),
        expand(rseqcdir + "{sample}/{sample}.junction_saturation.txt",
               sample=samples),
        expand(rseqcdir + "{sample}/{sample}.read_distribution.txt",
               sample=samples),
        expand(rseqcdir + "{sample}/{sample}.tin.xls", sample=samples),
        expand(countdir + "{sample}/{sample}.counts.txt", sample=samples)
    output:
        resultsdir + "multiqc-report.html"
    params:
        multiqcdir = multiqcdir
    log:
        multiqcdir + "log.multiqc.txt"
    shell:
        """
        # Run MultiQC
        multiqc results \
            --outdir {params.multiqcdir} \
            --ignore *_STAR* \
            --force \
                > {log} 2>&1

        # Move report file to results directory
        mv {params.multiqcdir}/multiqc_report.html {output}
        """
