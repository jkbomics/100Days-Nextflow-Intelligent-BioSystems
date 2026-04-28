process SIMULATION_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/real_world", mode: 'copy'

    input:
    path input_file

    output:
    path "real_world_results.tsv"

    script:
    """
    cp ${input_file} gene_expression.tsv
    python ${projectDir}/scripts/simulation_model.py
    """
}