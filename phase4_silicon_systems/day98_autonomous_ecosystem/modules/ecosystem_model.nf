process ECOSYSTEM_MODEL {

    publishDir "${projectDir}/results/ecosystem", mode: 'copy'

    input:
    path input_file

    output:
    path "autonomous_ecosystem.tsv"

    script:
    """
    cp ${input_file} collective_intelligence.tsv
    python ${projectDir}/scripts/ecosystem_model.py
    """
}