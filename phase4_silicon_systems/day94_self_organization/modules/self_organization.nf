process SELF_ORGANIZATION {

    publishDir "${projectDir}/results/self_organization", mode: 'copy'

    input:
    path input_file

    output:
    path "self_organized_network.tsv"

    script:
    """
    cp ${input_file} optimized_communication.tsv
    python ${projectDir}/scripts/self_organization.py
    """
}