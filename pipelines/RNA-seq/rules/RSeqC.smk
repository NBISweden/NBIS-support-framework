# Summarise alignment statistics
rule bam_stat:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.bam_stat.txt"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.bam_stat.txt"
    shell:
        """
        bam_stat.py \
            --input={input} \
                > {output} 2> {log}
        """

# Calculate gene body coverage of reads
rule gene_body_coverage:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.geneBodyCoverage.txt"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.geneBodyCoverage.txt"
    shell:
        """
        # Define paths and variables
        WORKDIR=$(pwd)
        INPUT=$(readlink -f {input})
        OUTPUT=$(readlink -f {output})
        REF_GENE=$(readlink -f {config[REF_GENE]})
        OUTDIR=$(dirname $OUTPUT)

        # Change to output directory and calculate gene body coverage
        cd $OUTDIR
        geneBody_coverage.py \
            --input=$INPUT \
            --out-prefix={wildcards.sample} \
            --refgene=$REF_GENE \
                > $OUTPUT 2> /dev/null

        # Fix data output to be readable by MultiQC
        echo $(echo "Percentile"; seq 1 100) | tr ' ' '\t' > temp_data.txt
        tail -n +4 $OUTPUT >> temp_data.txt
        mv temp_data.txt $OUTPUT

        # Change back to working directory and move log file
        cd $WORKDIR
        mv $OUTDIR/log.txt {log}
        """

# Infer experimental design
rule infer_experiment:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.infer_experiment.txt"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.infer_experiment.txt"
    shell:
        """
        infer_experiment.py \
            --input-file={input} \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

# Calculate the inner distance between the read pairs
rule inner_distance:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.inner_distance.txt"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.inner_distance.txt"
    shell:
        """
        inner_distance.py \
            --input-file={input} \
            --out-prefix=$(dirname {output})/ \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

# Calculate junction saturation
rule junction_saturation:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.junction_saturation.txt"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.junction_saturation.txt"
    shell:
        """
        junction_saturation.py \
            --input-file={input} \
            --out-prefix=$(dirname {output})/ \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

# Calculate genomic distribution of aligned reads
rule read_distribution:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.read_distribution.txt"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.read_distribution.txt"
    shell:
        """
        read_distribution.py \
            --input-file={input} \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

# Calculate the Transcript Integriy Number (TIN)
rule transcript_integrity:
    input:
        aligndir + "{sample}/{sample}.bam",
    output:
        rseqcdir + "{sample}/{sample}.tin.xls"
    log:
        rseqcdir + "{sample}/logs/log.{sample}.tin.txt"
    shell:
        """
        # Define paths and variables
        WORKDIR=$(pwd)
        INPUT=$(readlink -f {input})
        OUTDIR=$(dirname $(readlink -f {output}))
        REF_GENE=$(readlink -f {config[REF_GENE]})

        # Change to output directory and calculate TIN
        cd $OUTDIR
        tin.py \
            --input=$INPUT \
            --refgene=$REF_GENE \
                2> $(basename {log})

        # Rename summary files and move back to working directory
        mv {wildcards.sample}.summary.txt {wildcards.sample}.tin.summary.txt
        cd $WORKDIR
        """
