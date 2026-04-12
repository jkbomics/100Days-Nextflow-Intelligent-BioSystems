nextflow.enable.dsl=2

include { SIGNATURE_DETECTION } from './modules/signature_detection.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/control_vs_disease.tsv")

    results = SIGNATURE_DETECTION(input_data)

    results.view { "Signature genes: $it" }
}