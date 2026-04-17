process CROSSVAL_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/crossval", mode: 'copy'

    input:
    path input_file

    output:
    path "crossval_metrics.txt"

    script:
    """
    python ${projectDir}/scripts/crossval_model.py
    """
}