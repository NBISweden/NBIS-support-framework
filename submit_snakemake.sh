#!/bin/bash

# Run snakemake
snakemake \
    --snakefile Snakefile \
    --jobs 1 \
    --cluster-config cluster.yml \
    --cluster "sbatch \
                  --account {cluster.account} \
                  --time {cluster.time} \
                  --partition {cluster.partition} \
                  --ntasks {cluster.ntasks} \
                  --output=/dev/null \
                  --error=/dev/null"
