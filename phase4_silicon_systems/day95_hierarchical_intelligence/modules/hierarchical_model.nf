process HIERARCHICAL_MODEL {

    publishDir "${projectDir}/results/hierarchy", mode: 'copy'

    input:
    path input_file

    output:
    path "hierarchical_intelligence.tsv"

    script:
    """
    cp ${input_file} self_organized_network.tsv
    python ${projectDir}/scripts/hierarchical_model.py
    """
}