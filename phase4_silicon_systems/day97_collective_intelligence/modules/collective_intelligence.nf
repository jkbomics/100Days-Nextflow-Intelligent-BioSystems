process COLLECTIVE_INTELLIGENCE {

    publishDir "${projectDir}/results/collective", mode: 'copy'

    input:
    path input_file

    output:
    path "collective_intelligence.tsv"

    script:
    """
    cp ${input_file} meta_adaptation.tsv
    python ${projectDir}/scripts/collective_intelligence.py
    """
}