process ADAPTIVE_CONTROL {

    publishDir "${projectDir}/results/feedback", mode: 'copy'

    input:
    path input_file

    output:
    path "adaptive_feedback.tsv"

    script:
    """
    cp ${input_file} decision_output.tsv
    python ${projectDir}/scripts/adaptive_control.py
    """
}