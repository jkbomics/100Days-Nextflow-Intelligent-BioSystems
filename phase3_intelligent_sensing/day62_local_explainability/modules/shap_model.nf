process SHAP_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/shap", mode: 'copy'

    input:
    path input_file

    output:
    path "shap_values.tsv"

    script:
    """
    python ${projectDir}/scripts/shap_model.py
    """
}