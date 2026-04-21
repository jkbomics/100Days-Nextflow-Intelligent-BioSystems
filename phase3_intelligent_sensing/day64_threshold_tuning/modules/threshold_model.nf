process THRESHOLD_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/threshold", mode: 'copy'

    input:
    path input_file

    output:
    path "threshold_results.tsv"

    script:
    """
    python ${projectDir}/scripts/threshold_model.py
    """
}