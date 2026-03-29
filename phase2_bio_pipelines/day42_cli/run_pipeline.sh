#!/bin/bash

set -e

# Default values
INPUT="./input"
PROFILE="local"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --input) INPUT="$2"; shift ;;
        --profile) PROFILE="$2"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

echo "======================================"
echo "Running RNA-Seq Pipeline"
echo "Input: $INPUT"
echo "Profile: $PROFILE"
echo "======================================"

nextflow run main.nf \
    --input "$INPUT" \
    -profile "$PROFILE" \
    -resume