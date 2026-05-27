process SELF_SUSTAINING {

    publishDir "${projectDir}/results/self_sustaining", mode: 'copy'

    input:
    path input_file

    output:
    path "self_sustaining_intelligence.tsv"

    script:
    """
    cp ${input_file} autonomous_ecosystem.tsv
    python ${projectDir}/scripts/self_sustaining.py
    """
}