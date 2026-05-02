process ANOMALY {

    publishDir "${projectDir}/results", mode: 'copy'

    input:
    path input_file

    output:
    path "anomaly.tsv"

    script:
    """
    cp ${input_file} streaming.tsv
    python ${projectDir}/scripts/anomaly.py
    """
}