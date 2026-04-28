nextflow.enable.dsl=2

include { STREAMING_MODEL } from './modules/streaming_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/base_expression.tsv")

    results = STREAMING_MODEL(input_data)

    results.view { "Streaming output: $it" }
}