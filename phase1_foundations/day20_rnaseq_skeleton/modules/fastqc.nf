process FASTQC {

    label 'qc'

    input:
    tuple val(sample), path(reads)

    output:
    stdout

    script:
    """
    echo "Running FastQC on sample: ${sample}"
    echo "Input reads: ${reads}"
    """
}