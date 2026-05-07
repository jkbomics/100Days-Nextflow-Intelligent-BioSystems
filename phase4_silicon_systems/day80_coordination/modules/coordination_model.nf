process COORDINATION_MODEL {

    publishDir "${projectDir}/results/coordination", mode: 'copy'

    input:
    path input_file

    output:
    path "system_coordination.tsv"

    script:
    """
    cp ${input_file} adaptive_feedback.tsv
    python ${projectDir}/scripts/coordination_model.py
    """
}