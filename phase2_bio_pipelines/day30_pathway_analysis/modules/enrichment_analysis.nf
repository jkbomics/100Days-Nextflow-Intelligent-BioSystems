process ENRICHMENT_ANALYSIS {

    label 'analysis'

    publishDir "results/enrichment", mode: 'copy'

    input:
    path deseq_results

    output:
    path "kegg_enrichment.tsv"
    path "go_enrichment.tsv"
    path "*.png"

    script:
    """
    cp ${deseq_results} deseq2_results.tsv

    Rscript ${projectDir}/scripts/enrichment_analysis.R
    """
}