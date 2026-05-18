process DECENTRALIZED_MODEL {

    publishDir "${projectDir}/results/decentralized", mode: 'copy'

    input:
    path input_file

    output:
    path "decentralized_decisions.tsv"

    script:
    """
    cp ${input_file} distributed_intelligence.tsv
    python ${projectDir}/scripts/decentralized_model.py
    """
}