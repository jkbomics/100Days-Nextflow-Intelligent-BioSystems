process POPULATION_MODEL {

    publishDir "${projectDir}/results/population", mode: 'copy'

    input:
    path input_file

    output:
    path "population_simulation.tsv"

    script:
    """
    cp ${input_file} evolutionary_adaptation.tsv
    python ${projectDir}/scripts/population_model.py
    """
}