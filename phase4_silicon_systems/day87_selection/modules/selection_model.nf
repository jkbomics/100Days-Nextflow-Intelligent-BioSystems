process SELECTION_MODEL {

    publishDir "${projectDir}/results/selection", mode: 'copy'

    input:
    path input_file

    output:
    path "selection_results.tsv"

    script:
    """
    cp ${input_file} population_simulation.tsv
    python ${projectDir}/scripts/selection_model.py
    """
}