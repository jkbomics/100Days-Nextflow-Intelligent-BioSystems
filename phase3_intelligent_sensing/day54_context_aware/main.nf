nextflow.enable.dsl=2

include { CONTEXT_MODEL } from './modules/context_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/gene_expression.tsv")

    results = CONTEXT_MODEL(input_data)

    results.view { "Context-aware results: $it" }
}