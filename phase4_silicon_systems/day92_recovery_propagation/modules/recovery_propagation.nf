process RECOVERY_PROPAGATION {

    publishDir "${projectDir}/results/recovery", mode: 'copy'

    input:
    path input_file

    output:
    path "recovery_propagation.tsv"

    script:
    """
    cp ${input_file} node_resilience.tsv
    python ${projectDir}/scripts/recovery_propagation.py
    """
}