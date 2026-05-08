process RESOURCE_ADAPTATION {

    publishDir "${projectDir}/results/resource", mode: 'copy'

    input:
    path input_file

    output:
    path "resource_adaptation.tsv"

    script:
    """
    cp ${input_file} system_coordination.tsv
    python ${projectDir}/scripts/resource_adaptation.py
    """
}