process FEATURE_SELECTION {

    label 'analysis'

    publishDir "${projectDir}/results/pipeline", mode: 'copy'

    input:
    path input_file

    output:
    path "selected_genes.tsv"

    script:
    """
    cp ${input_file} expression_matrix.tsv
    python ${projectDir}/scripts/feature_selection.py
    """
}