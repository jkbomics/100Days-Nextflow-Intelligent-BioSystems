process PATHWAY_ANALYSIS {

    label 'analysis'

    publishDir "results/pathway", mode: 'copy'

    input:
    path gene_list

    output:
    path "kegg_results.tsv"
    path "go_results.tsv"

    script:
    """
    cp ${gene_list} gene_list.txt

    Rscript ${projectDir}/scripts/pathway_analysis.R
    """
}