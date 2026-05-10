process SELF_HEALING {

    publishDir "${projectDir}/results/healing", mode: 'copy'

    input:
    path input_file

    output:
    path "self_healing.tsv"

    script:
    """
    cp ${input_file} predictive_failure.tsv
    python ${projectDir}/scripts/self_healing.py
    """
}