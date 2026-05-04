process ANOMALY_DETECTION {

    publishDir "${projectDir}/results/anomaly", mode: 'copy'

    input:
    path input_file

    output:
    path "silicon_anomalies.tsv"

    script:
    """
    cp ${input_file} silicon_stream.tsv
    python ${projectDir}/scripts/anomaly_detection.py
    """
}