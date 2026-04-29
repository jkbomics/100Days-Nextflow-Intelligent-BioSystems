nextflow.enable.dsl=2

include { REALTIME_DETECTION } from './modules/realtime_detection.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/streaming_expression.tsv")

    results = REALTIME_DETECTION(input_data)

    results.view { "Realtime detection: $it" }
}