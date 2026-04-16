process EVALUATION_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/evaluation", mode: 'copy'

    input:
    path input_file

    output:
    path "test_predictions.tsv"
    path "metrics.txt"

    script:
    """
    python ${projectDir}/scripts/evaluation_model.py
    """
}