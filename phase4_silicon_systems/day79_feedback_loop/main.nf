nextflow.enable.dsl=2

include { ADAPTIVE_CONTROL } from './modules/adaptive_control.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/decision_output.tsv")

    results = ADAPTIVE_CONTROL(input_data)

    results.view { "Adaptive feedback: $it" }
}