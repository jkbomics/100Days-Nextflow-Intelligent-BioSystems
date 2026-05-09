process PREDICTIVE_FAILURE {

    publishDir "${projectDir}/results/predictive", mode: 'copy'

    input:
    path input_file

    output:
    path "predictive_failure.tsv"

    script:
    """
    cp ${input_file} resource_adaptation.tsv
    python ${projectDir}/scripts/predictive_failure.py
    """
}