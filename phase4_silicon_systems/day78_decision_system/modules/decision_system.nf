process DECISION_SYSTEM {

    publishDir "${projectDir}/results/decision", mode: 'copy'

    input:
    path input_file

    output:
    path "decision_output.tsv"

    script:
    """
    cp ${input_file} silicon_anomalies.tsv
    python ${projectDir}/scripts/decision_system.py
    """
}