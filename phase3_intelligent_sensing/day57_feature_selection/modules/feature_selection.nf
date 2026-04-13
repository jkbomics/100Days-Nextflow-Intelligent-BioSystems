process FEATURE_SELECTION {

    label 'analysis'

    publishDir "${projectDir}/results/feature_selection", mode: 'copy'

    input:
    path input_file

    output:
    path "selected_features.tsv"

    script:
    """
    python ${projectDir}/scripts/feature_selection.py
    """
}