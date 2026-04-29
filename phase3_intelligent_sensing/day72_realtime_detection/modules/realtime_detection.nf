process REALTIME_DETECTION {

    label 'analysis'

    publishDir "${projectDir}/results/realtime", mode: 'copy'

    input:
    path input_file

    output:
    path "realtime_anomalies.tsv"

    script:
    """
    cp ${input_file} streaming_expression.tsv
    python ${projectDir}/scripts/realtime_detection.py
    """
}