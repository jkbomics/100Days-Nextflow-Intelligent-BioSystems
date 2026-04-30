process ADAPTIVE_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/adaptive", mode: 'copy'

    input:
    path input_file

    output:
    path "adaptive_results.tsv"

    script:
    """
    cp ${input_file} streaming_expression.tsv
    python ${projectDir}/scripts/adaptive_model.py
    """
}