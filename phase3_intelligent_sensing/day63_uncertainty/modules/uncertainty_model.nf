process UNCERTAINTY_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/uncertainty", mode: 'copy'

    input:
    path input_file

    output:
    path "uncertainty_results.tsv"

    script:
    """
    python ${projectDir}/scripts/uncertainty_model.py
    """
}