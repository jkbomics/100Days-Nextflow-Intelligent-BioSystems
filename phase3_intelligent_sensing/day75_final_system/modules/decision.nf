process DECISION {

    publishDir "${projectDir}/results", mode: 'copy'

    input:
    path anomaly_file
    path adaptive_file
    path drift_file

    output:
    path "final_output.tsv"

    script:
    """
    cp ${anomaly_file} anomaly.tsv
    cp ${adaptive_file} adaptive.tsv
    cp ${drift_file} drift.tsv

    python ${projectDir}/scripts/decision.py
    """
}