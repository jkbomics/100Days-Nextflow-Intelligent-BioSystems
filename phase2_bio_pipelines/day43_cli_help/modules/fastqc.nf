process FASTQC {

    label 'qc'

    publishDir "results/fastqc", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    tuple val(sample), path(reads)

    script:
    """
    echo "Running QC for ${sample}"
    sleep 1
    """
}