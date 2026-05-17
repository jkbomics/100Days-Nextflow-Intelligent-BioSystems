process DISTRIBUTED_MODEL {

    publishDir "${projectDir}/results/distributed", mode: 'copy'

    input:
    path input_file

    output:
    path "distributed_intelligence.tsv"

    script:
    """
    cp ${input_file} emergent_behavior.tsv
    python ${projectDir}/scripts/distributed_model.py
    """
}