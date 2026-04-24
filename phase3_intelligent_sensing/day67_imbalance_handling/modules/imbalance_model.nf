process IMBALANCE_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/imbalance", mode: 'copy'

    input:
    path input_file

    output:
    path "imbalance_report.txt"

    script:
    """
    python ${projectDir}/scripts/imbalance_model.py
    """
}