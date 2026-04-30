nextflow.enable.dsl=2

include { ADAPTIVE_MODEL } from './modules/adaptive_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/streaming_expression.tsv")

    results = ADAPTIVE_MODEL(input_data)

    results.view { "Adaptive model output: $it" }
}