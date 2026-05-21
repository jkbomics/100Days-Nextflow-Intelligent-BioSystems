process COMMUNICATION_OPTIMIZATION {

    publishDir "${projectDir}/results/communication", mode: 'copy'

    input:
    path input_file

    output:
    path "optimized_communication.tsv"

    script:
    """
    cp ${input_file} recovery_propagation.tsv
    python ${projectDir}/scripts/communication_optimization.py
    """
}