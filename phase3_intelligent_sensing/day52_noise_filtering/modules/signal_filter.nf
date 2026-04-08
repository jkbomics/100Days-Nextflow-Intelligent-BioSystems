process SIGNAL_FILTER {

    label 'filtering'

    publishDir "results/filtering", mode: 'copy'

    output:
    path "filtered_signal.tsv"

    script:
    """
    python ${projectDir}/scripts/noise_filter.py
    """
}