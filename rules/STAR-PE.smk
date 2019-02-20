# Rule: STAR 2-pass with paired-end reads
rule STAR_PE:
    input:
        read_1 = datadir + "{sample}_1.fastq.gz",
        read_2 = datadir + "{sample}_2.fastq.gz"
    output:
        aligndir + "{sample}.bam"
    log:
        aligndir + "log.{sample}.STAR-PE.txt"
    shell:
        """
        OUTDIR=$(dirname {output})
        mkdir -p $OUTDIR
        STAR \
            --genomeDir {config[STAR_REF]} \
            --runThreadN {config[STAR_THREADS]} \
            --readFilesIn {input.read_1} {input.read_2} \
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
