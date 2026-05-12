process EVOLUTIONARY_MODEL {

    publishDir "${projectDir}/results/evolution", mode: 'copy'

    input:
    path input_file

    output:
    path "evolutionary_adaptation.tsv"

    script:
    """
    cp ${input_file} lifecycle_simulation.tsv
    python ${projectDir}/scripts/evolutionary_model.py
    """
}