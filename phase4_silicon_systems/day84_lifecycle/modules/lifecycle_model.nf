process LIFECYCLE_MODEL {

    publishDir "${projectDir}/results/lifecycle", mode: 'copy'

    input:
    path input_file

    output:
    path "lifecycle_simulation.tsv"

    script:
    """
    cp ${input_file} self_healing.tsv
    python ${projectDir}/scripts/lifecycle_model.py
    """
}