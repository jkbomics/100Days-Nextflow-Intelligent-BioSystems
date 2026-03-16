process DESEQ2_ANALYSIS {

    label 'analysis'

    publishDir "results/deseq2", mode: 'copy'

    input:
    path counts
    path design

    output:
    path "deseq2_results.tsv"
    path "volcano_plot.png"

    script:
    """
    Rscript ${projectDir}/scripts/deseq2_analysis.R
    """
}