process DRIFT_DETECTION {

    label 'analysis'

    publishDir "${projectDir}/results/drift", mode: 'copy'

    input:
    path input_file

    output:
    path "drift_results.tsv"

    script:
    """
    cp ${input_file} streaming_expression.tsv
    python ${projectDir}/scripts/drift_detection.py
    """
}