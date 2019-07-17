# Read counting
rule featureCounts:
    input:
        aligndir + "{sample}/{sample}.bam"
    output:
        countdir + "{sample}/{sample}.gene-counts.txt"
    params:
        gtf = config["REF_GTF"]
    log:
        countdir + "{sample}/logs/log.{sample}.featureCounts.txt"
    shell:
        """
        # Count reads
        featureCounts \
            -a {params.gtf} \
            -o {output} \
            -T 1 \
            -t exon \
            -g gene_id \
            -s 2 \
            --extraAttributes gene_name \
            {input} \
                > {log} 2>&1

        # Fix header
        bash scripts/fix-count-header.sh \
            {output} \
            1,7,8 \
            ENSGID \
            {output}.tmp \
                2> {log}
        mv {output}.tmp {output}
        """
