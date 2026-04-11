process ADAPTIVE_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/adaptive", mode: 'copy'

    input:
    path gene_file

    output:
    path "adaptive_results.tsv"

    script:
    """
    python ${projectDir}/scripts/adaptive_model.py
    """
}