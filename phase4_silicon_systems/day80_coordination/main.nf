nextflow.enable.dsl=2

include { COORDINATION_MODEL } from './modules/coordination_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/adaptive_feedback.tsv")

    results = COORDINATION_MODEL(input_data)

    results.view { "Coordination output: $it" }
}