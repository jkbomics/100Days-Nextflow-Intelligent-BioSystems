nextflow.enable.dsl=2

params.threshold = params.threshold ?: 40

include { FILTER_GENES } from './modules/filter_genes.nf'

workflow {

    println "Using threshold: ${params.threshold}"

    /*
     * Emit multiple files
     */
    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    /*
     * Each file triggers a separate process execution
     */
    results = FILTER_GENES(samples, params.threshold)

    results.view()
}