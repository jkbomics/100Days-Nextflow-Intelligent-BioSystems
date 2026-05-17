nextflow.enable.dsl=2

include { DISTRIBUTED_MODEL } from './modules/distributed_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/emergent_behavior.tsv")

    results = DISTRIBUTED_MODEL(input_data)

    results.view { "Distributed intelligence: $it" }
}