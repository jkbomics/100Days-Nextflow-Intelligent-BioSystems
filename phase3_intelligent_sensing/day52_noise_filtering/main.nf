nextflow.enable.dsl=2

params.input = "input/gene_expression.tsv"

process SIGNAL_FILTER {

    input:
    path gene_file

    output:
    path "filtered_signal.tsv"

    script:
    """
    python ${projectDir}/scripts/noise_filter.py ${gene_file}
    """
}

workflow {

    gene_ch = Channel.fromPath(params.input, checkIfExists: true)

    SIGNAL_FILTER(gene_ch)
}