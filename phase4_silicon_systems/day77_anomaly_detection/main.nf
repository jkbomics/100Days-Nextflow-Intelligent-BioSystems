nextflow.enable.dsl=2

include { ANOMALY_DETECTION } from './modules/anomaly_detection.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/silicon_stream.tsv")

    results = ANOMALY_DETECTION(input_data)

    results.view { "Anomaly results: $it" }
}