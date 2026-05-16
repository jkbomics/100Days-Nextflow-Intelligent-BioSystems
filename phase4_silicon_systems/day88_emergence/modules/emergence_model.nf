process EMERGENCE_MODEL {

    publishDir "${projectDir}/results/emergence", mode: 'copy'

    input:
    path input_file

    output:
    path "emergent_behavior.tsv"

    script:
    """
    cp ${input_file} selection_results.tsv
    python ${projectDir}/scripts/emergence_model.py
    """
}