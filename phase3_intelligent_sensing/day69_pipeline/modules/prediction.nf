process PREDICTION {

    label 'analysis'

    publishDir "${projectDir}/results/pipeline", mode: 'copy'

    input:
    path input_file

    output:
    path "prediction.tsv"

    script:
    """
    cp ${input_file} expression_matrix.tsv
    python ${projectDir}/scripts/prediction.py
    """
}