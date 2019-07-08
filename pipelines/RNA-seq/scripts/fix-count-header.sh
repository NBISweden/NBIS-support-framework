# Input and output
INPUT="$1"
FIELDS="$2"
ROWID="$3"
OUTPUT="$4"

# Get new header
HEADER=$(tail -n +2 "$INPUT" | head -1 \
    | cut -f "$FIELDS" \
    | tr '\t' '\n' \
    | sed "s/Geneid/$ROWID/g" \
    | sed 's/gene_name/gene/g' \
    | sed 's/.*\///g' \
    | sed 's/\.bam//g' \
    | xargs \
    | tr ' ' '\t')

# Set the new header
cat <(echo "$HEADER") \
    <(tail -n +3 "$INPUT" \
        | cut -f "$FIELDS") \
    > "$OUTPUT"
