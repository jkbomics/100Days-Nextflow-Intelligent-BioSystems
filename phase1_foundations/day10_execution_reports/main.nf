nextflow.enable.dsl=2

params.threshold = params.threshold ?: 40

include { FILTER_GENES } from './modules/filter_genes.nf'

workflow {

    println "Using threshold: ${params.threshold}"

    input_channel = Channel.fromPath("${projectDir}/input/expression.txt")

    result = FILTER_GENES(input_channel, params.threshold)

    result.view()
}