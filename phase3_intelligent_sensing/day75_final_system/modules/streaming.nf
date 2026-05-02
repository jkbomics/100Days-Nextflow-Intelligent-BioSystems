process STREAMING {

    publishDir "${projectDir}/results", mode: 'copy'

    input:
    path input_file

    output:
    path "streaming.tsv"

    script:
    """
    cp ${input_file} base_expression.tsv
    python ${projectDir}/scripts/streaming.py
    """
}