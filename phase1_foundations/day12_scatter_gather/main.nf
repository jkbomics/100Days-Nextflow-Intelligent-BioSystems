nextflow.enable.dsl=2

params.threshold = params.threshold ?: 40

include { FILTER_GENES } from './modules/filter_genes.nf'
include { SUMMARIZE_RESULTS } from './modules/summarize.nf'

workflow {

    println "Using threshold: ${params.threshold}"

    /*
     * Scatter
     */
    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    filtered = FILTER_GENES(samples, params.threshold)

    /*
     * Gather results into one stream
     */
    aggregated = filtered.collect()

    summary = SUMMARIZE_RESULTS(aggregated)

    summary.view()
}