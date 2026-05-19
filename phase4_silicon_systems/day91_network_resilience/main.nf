nextflow.enable.dsl=2

include { RESILIENCE_MODEL } from './modules/resilience_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/decentralized_decisions.tsv")

    results = RESILIENCE_MODEL(input_data)

    results.view { "Resilience output: $it" }
}