process ANOMALY_DETECTION {

    label 'analysis'

    publishDir "${projectDir}/results/anomaly", mode: 'copy'

    input:
    path input_file

    output:
    path "anomaly_results.tsv"

    script:
    """
    cp ${input_file} control_vs_disease.tsv
    python ${projectDir}/scripts/anomaly_detection.py
    """
}