process RESILIENCE_MODEL {

    publishDir "${projectDir}/results/resilience", mode: 'copy'

    input:
    path input_file

    output:
    path "node_resilience.tsv"
    path "network_resilience.tsv"

    script:
    """
    cp ${input_file} decentralized_decisions.tsv
    python ${projectDir}/scripts/resilience_model.py
    """
}