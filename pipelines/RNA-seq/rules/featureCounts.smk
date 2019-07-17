# Read counting
rule featureCounts:
    input:
        aligndir + "{sample}/{sample}.bam"
    output:
        countdir + "{sample}/{sample}.counts.txt"
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

# Rule: Collect gene counts
rule collect_counts:
    input:
        expand(countdir + "{sample}/{sample}.counts.txt", sample=samples)
    output:
        countdir + "collected-counts.txt"
    log:
        countdir + "log.collect-counts.txt"
    shell:
        """
        # Initialise counts with first file
        FIRST=$(echo {input} | cut -d " " -f 1)
        cat "$FIRST" \
            > {output}.joined 2> {log}

        # Loop through other files and join with first iteratively
        for FILE in $(echo {input} | cut -d " " -f 2-); do
            join <(cat {output}.joined) \
                <(cat "$FILE" | cut -f 1,3) \
                > {output}.new
            mv {output}.new {output}.joined
        done 2> {log}

        # Finalise output and remove intermediate files
        cat {output}.joined \
            | tr ' ' '\t' \
            > {output} 2> {log}
        rm {output}.joined \
            2> {log}
        """
