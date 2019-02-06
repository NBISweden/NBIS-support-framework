# Rules for alignment QC using RSeqC modules

# Calculate gene body coverage of reads
rule gene_body_coverage:
    input:
        "results/bam/{sample}/{sample}.bam",
    output:
        "results/qc/rseqc/{sample}.geneBodyCoverage.txt"
    log:
        "results/logs/log.{sample}.geneBodyCoverage.txt"
    shell:
        """
        geneBody_coverage.py \
            --input={input} \
            --out-prefix=results/qc/rseqc/{wildcards.sample} \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

# Calculate the inner distance between the read pairs
rule inner_distance:
    input:
        "results/bam/{sample}/{sample}.bam",
    output:
        "results/qc/rseqc/{sample}.inner_distance.txt"
    log:
        "results/logs/log.{sample}.inner_distance.txt"
    shell:
        """
        inner_distance.py \
            --input-file={input} \
            --out-prefix=results/qc/rseqc/{wildcards.sample} \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

# Calculate junction saturation
rule junction_saturation:
    input:
        "results/bam/{sample}/{sample}.bam",
    output:
        "results/qc/rseqc/{sample}.junction_saturation.txt"
    log:
        "results/logs/log.{sample}.junction_saturation.txt"
    shell:
        """
        junction_saturation.py \
            --input-file={input} \
            --out-prefix=results/qc/rseqc/{wildcards.sample} \
            --refgene={config[REF_GENE]} \
                > {output} 2> {log}
        """

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
