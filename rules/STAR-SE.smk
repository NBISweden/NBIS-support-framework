# Rule: STAR 2-pass with paired-end reads
rule STAR_SE:
    input:
        datadir + "{sample}.fastq.gz",
    output:
        aligndir + "{sample}/{sample}.bam"
    log:
        aligndir + "{sample}/log.{sample}.STAR-SE.txt"
    shell:
        """
        OUTDIR=$(dirname {output})
        mkdir -p $OUTDIR
        STAR \
            --genomeDir {config[STAR_REF]} \
            --runThreadN {config[STAR_THREADS]} \
            --readFilesIn {input} \
            --readFilesCommand zcat \
            --twopassMode Basic \
            --outSAMtype BAM SortedByCoordinate \
            --outFileNamePrefix $OUTDIR/ \
                > {log} 2>&1

        mv $OUTDIR/Aligned.sortedByCoord.out.bam \
            $OUTDIR/{wildcards.sample}.bam

        samtools index $OUTDIR/{wildcards.sample}.bam

        cat $OUTDIR/Log.out >> {log}
        cat $OUTDIR/Log.final.out >> {log}
        """
