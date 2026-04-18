process INTERPRET_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/interpretation", mode: 'copy'

    input:
    path input_file

    output:
    path "feature_importance.tsv"

    script:
    """
    python ${projectDir}/scripts/interpret_model.py
    """
}