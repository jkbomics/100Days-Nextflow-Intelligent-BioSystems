process CONTEXT_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/context", mode: 'copy'

    input:
    path gene_file

    output:
    path "context_aware_results.tsv"

    script:
    """
    python ${projectDir}/scripts/context_model.py
    """
}