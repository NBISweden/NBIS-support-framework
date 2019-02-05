# Rules for alignment QC using RSeqC modules

# Calculate genomic distribution of aligned reads
rule read_distribution:
    input:
        "results/bam/{sample}/{sample}.bam",
    output:
        "results/qc/rseqc/{sample}.read_distribution.txt"
    log:
        "results/logs/log.{sample}.read_distribution.txt"
    shell:
        """
        read_distribution.py \
            --input-file={input} \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """
