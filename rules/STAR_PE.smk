# Rule: STAR 2-pass with paired-end reads
rule STAR_PE:
    input:
        r1 = "data/example_data/fastq/{sample}_1.fastq.gz",
        r2 = "data/example_data/fastq/{sample}_2.fastq.gz"
    output:
        "results/bam/{sample}/{sample}.bam"
    log:
        "results/logs/log.{sample}.STAR-PE.txt"
    shell:
        """
        mkdir -p results/bam/{wildcards.sample}
        STAR \
            --genomeDir {config[STAR_REF]} \
            --runThreadN {config[STAR_THREADS]} \
            --readFilesIn {input.r1} {input.r2} \
            --readFilesCommand zcat \
            --twopassMode Basic \
            --outSAMtype BAM SortedByCoordinate \
            --outFileNamePrefix results/bam/{wildcards.sample}/ \
                > {log} 2>&1

        mv results/bam/{wildcards.sample}/Aligned.sortedByCoord.out.bam \
            results/bam/{wildcards.sample}/{wildcards.sample}.bam

        cat results/bam/{wildcards.sample}/Log.out >> {log}
        cat results/bam/{wildcards.sample}/Log.final.out >> {log}
        """
