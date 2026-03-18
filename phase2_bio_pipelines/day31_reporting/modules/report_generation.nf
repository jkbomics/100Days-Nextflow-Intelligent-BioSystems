process GENERATE_REPORT {

    label 'post_processing'

    publishDir "results/final_report", mode: 'copy'

    input:
    path enrichment_plots

    output:
    path "report.html"

    script:
    """
    python ${projectDir}/scripts/generate_report.py
    """
}