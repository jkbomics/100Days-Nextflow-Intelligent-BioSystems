process META_ADAPTATION {

    publishDir "${projectDir}/results/meta_adaptation", mode: 'copy'

    input:
    path input_file

    output:
    path "meta_adaptation.tsv"

    script:
    """
    cp ${input_file} hierarchical_intelligence.tsv
    python ${projectDir}/scripts/meta_adaptation.py
    """
}