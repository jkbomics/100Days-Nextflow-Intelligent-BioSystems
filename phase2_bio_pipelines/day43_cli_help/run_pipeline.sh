#!/bin/bash

set -e

show_help() {
    echo "======================================"
    echo "RNA-Seq Intelligent Pipeline"
    echo "======================================"
    echo ""
    echo "Usage:"
    echo "  ./run_pipeline.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --input      Path to input FASTQ directory"
    echo "  --profile    Execution profile (local/docker/slurm)"
    echo "  --help       Show this help message"
    echo ""
    echo "Example:"
    echo "  ./run_pipeline.sh --input ./data --profile docker"
    echo ""
}

# Default values
INPUT="./input"
PROFILE="local"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --input) INPUT="$2"; shift ;;
        --profile) PROFILE="$2"; shift ;;
        --help) show_help; exit 0 ;;
        *) echo "Unknown parameter: $1"; show_help; exit 1 ;;
    esac
    shift
done

# Validation
if [ ! -d "$INPUT" ]; then
    echo "ERROR: Input directory not found: $INPUT"
    exit 1
fi

echo "======================================"
echo "Running RNA-Seq Pipeline"
echo "Input: $INPUT"
echo "Profile: $PROFILE"
echo "======================================"

nextflow run main.nf \
    --input "$INPUT" \
    -profile "$PROFILE" \
    -resume