process STREAMING_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/streaming", mode: 'copy'

    input:
    path input_file

    output:
    path "streaming_expression.tsv"

    script:
    """
    cp ${input_file} base_expression.tsv
    python ${projectDir}/scripts/streaming_model.py
    """
}