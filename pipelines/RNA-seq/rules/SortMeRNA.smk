# Define list of rRNA databases to use
databases = ["silva-euk-18s-id95.fasta",
             "silva-euk-28s-id98.fasta"]

# Define list of rRNA index files
indexes = ["idx.stats",
           "idx.bursttrie_0.dat",
           "idx.kmer_0.dat",
           "idx.pos_0.dat"]

# Rule: download and index rRNA databases
rule SortMeRNA_indexes:
    output:
        fasta = expand(sortmernadir + "indexes/{database}",
                       database = databases),
        indexes = expand(sortmernadir + "indexes/{database}.{index}",
                         database = databases, index = indexes)
    params:
        databases = databases,
        sortmernaindexdir = sortmernadir + "indexes/"
    log:
        sortmernadir + "indexes/log.SortMeRNA-indexing.txt"
    shell:
        """
        # Download rRNA databases
        ADRESS="https://raw.githubusercontent.com/biocore/sortmerna/master"
        ADRESS="$ADRESS/rRNA_databases"
        for DATABASE in {params.databases}; do
            wget \
                "$ADRESS/$DATABASE" \
                -P {params.sortmernaindexdir} \
                    > {log} 2>&1
        done

        # Index rRNA databases
        mkdir "{params.sortmernaindexdir}/tmp"
        for DATABASE in {params.databases}; do

            # Define paths
            FASTA="{params.sortmernaindexdir}/$DATABASE"
            INDEX="{params.sortmernaindexdir}/$DATABASE.idx"

            # Index
            indexdb_rna \
                --ref "$FASTA,$INDEX" \
                --tmpdir "{params.sortmernaindexdir}/tmp/" \
                -v \
                    >> {log} 2>&1
        done
        rm -r "{params.sortmernaindexdir}/tmp"
        """

# Rule: Find rRNA contamination in raw reads
rule SortMeRNA:
    input:
        fasta = expand(sortmernadir + "indexes/{database}",
                       database = databases),
        indexes = expand(sortmernadir + "indexes/{database}.{index}",
                         database = databases, index = indexes),
        reads = datadir + "{sample}.fastq.gz"
    output:
        data = sortmernadir + "{sample}.rRNA.fastq.gz",
        stats = sortmernadir + "stats.{sample}.txt"
    log:
        sortmernadir + "log.{sample}.SortMeRNA.txt"
    shell:
        """
        # Path definitions
        OUTDIR=$(dirname {output.data})
        INUNZIPPED="$OUTDIR/in.{wildcards.sample}.fastq"
        OUTUNZIPPED="$OUTDIR/out.{wildcards.sample}"
        FASTA=$(echo "{input.fasta[0]},\
            {input.fasta[0]}.idx:\
            {input.fasta[1]},\
            {input.fasta[1]}.idx" | tr -d ' ')

        # Unzip FASTQ file
        cat {input.reads} | zcat > $INUNZIPPED

        # Run SortMeRNA
        sortmerna \
            --ref $FASTA \
            --reads $INUNZIPPED \
            --aligned $OUTUNZIPPED \
            --fastx \
            -v \
            --log \
                > {log} 2>&1

        # Zip rRNA FASTQ file and remove tempfile
        gzip $OUTUNZIPPED.fastq
        mv $OUTUNZIPPED.fastq.gz {output.data}
        rm $INUNZIPPED

        # Concatenate logs
        cat $OUTUNZIPPED.log >> {log}
        rm $OUTUNZIPPED.log

        # Replace temporary input sample names in log
        sed 's/in\.//g' {log} > $OUTDIR.tmp
        mv $OUTDIR.tmp {log}

        # Create statistics file
        TOTAL_STRING="Total reads = "
        TOTAL_READS=$(cat {log} \
            | grep "$TOTAL_STRING" \
            | sed "s/$TOTAL_STRING//g" \
            | tr -d ' ')
        RRNA_STRING="Total reads passing E-value threshold = "
        RRNA_READS=$(cat {log} \
            | grep "$RRNA_STRING" \
            | sed "s/$RRNA_STRING//g" \
            | tr -d ' ' \
            | cut -d '(' -f 1)
        echo sample total rrna \
            | tr ' ' '\t' \
                > {output.stats}
        echo {wildcards.sample} $TOTAL_READS $RRNA_READS \
            | tr ' ' '\t' \
                >> {output.stats}
        """
