process FASTQC {

    label 'qc'

    publishDir "results/fastqc", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    path "*.html"
    path "*.zip"

    script:
    """
    fastqc ${reads}
    """
}