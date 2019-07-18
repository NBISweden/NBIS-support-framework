# Rule: Download Ensembl GTF file
rule download_gtf:
    output:
        "scratch/" + config["ASSEMBLY"] + ".gtf.gz"
    log:
        "scratch/log.download-gtf.txt"
    shell:
        """
        ADDRESS="rsync://ftp.ensembl.org/ensembl/pub/release-97/gtf"
        ADDRESS="$ADDRESS/homo_sapiens/{config[ASSEMBLY]}.gtf.gz"
        rsync -avP $ADDRESS {output} \
            > {log} 2>&1
        """

# Read counting
rule featureCounts:
    input:
        gtf = "scratch/" + config["ASSEMBLY"] + ".gtf.gz",
        bam = aligndir + "{sample}/{sample}.bam"
    output:
        countdir + "{sample}/{sample}.counts.txt"
    log:
        countdir + "{sample}/log.{sample}.featureCounts.txt"
    shell:
        """
        # Count reads
        featureCounts \
            -a {input.gtf} \
            -o {output} \
            -T 1 \
            -t exon \
            -g gene_id \
            -s 2 \
            --extraAttributes gene_name \
            {input.bam} \
                > {log} 2>&1

        # Get new header
        HEADER=$(head -n 2 {output} \
            | tail -n +2 \
            | cut -f 1,7,8 \
            | tr '\t' '\n' \
            | sed 's/Geneid/ENSGID/g' \
            | sed 's/gene_name/gene/g' \
            | sed 's/.*\///g' \
            | sed 's/\.bam//g' \
            | xargs \
            | tr ' ' '\t') \
                2>> {log}

        # Set the new header
        cat <(echo "$HEADER") \
            <(tail -n +3 {output} \
                | cut -f 1,7,8) \
            > {output}.tmp \
                2>> {log}
        mv {output}.tmp {output}
        """

# Rule: Collect gene counts
rule collect_counts:
    input:
        expand(countdir + "{sample}/{sample}.counts.txt", sample=samples)
    output:
        resultsdir + "collected-counts.txt"
    log:
        multiqcdir + "log.collect-counts.txt"
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
        done 2>> {log}

        # Finalise output and remove intermediate files
        cat {output}.joined \
            | tr ' ' '\t' \
            > {output} \
                2>> {log}
        rm {output}.joined \
            2>> {log}
        """
