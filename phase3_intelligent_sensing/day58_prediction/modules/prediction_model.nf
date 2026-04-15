process PREDICTION_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/prediction", mode: 'copy'

    input:
    path input_file

    output:
    path "predictions.tsv"
    path "accuracy.txt"

    script:
    """
    python ${projectDir}/scripts/prediction_model.py
    """
}