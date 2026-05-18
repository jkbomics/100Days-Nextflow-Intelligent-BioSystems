nextflow.enable.dsl=2

include { DECENTRALIZED_MODEL } from './modules/decentralized_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/distributed_intelligence.tsv")

    results = DECENTRALIZED_MODEL(input_data)

    results.view { "Decentralized decisions: $it" }
}