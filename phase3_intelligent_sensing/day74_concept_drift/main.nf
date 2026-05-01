nextflow.enable.dsl=2

include { DRIFT_DETECTION } from './modules/drift_detection.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/streaming_expression.tsv")

    results = DRIFT_DETECTION(input_data)

    results.view { "Drift detection: $it" }
}