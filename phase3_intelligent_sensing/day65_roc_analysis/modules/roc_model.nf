process ROC_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/roc", mode: 'copy'

    input:
    path input_file

    output:
    path "roc_values.tsv"
    path "roc_curve.png"

    script:
    """
    python ${projectDir}/scripts/roc_model.py
    """
}