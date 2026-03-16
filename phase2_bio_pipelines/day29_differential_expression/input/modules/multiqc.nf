process MULTIQC {

    label 'report'

    publishDir "results/multiqc", mode: 'copy'

    input:
    path qc_files

    output:
    path "multiqc_report.html"

    script:
    """
    multiqc .
    """
}