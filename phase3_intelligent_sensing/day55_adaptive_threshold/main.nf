nextflow.enable.dsl=2

include { ADAPTIVE_MODEL } from './modules/adaptive_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/gene_expression.tsv")

    results = ADAPTIVE_MODEL(input_data)

    results.view { "Adaptive results: $it" }
}