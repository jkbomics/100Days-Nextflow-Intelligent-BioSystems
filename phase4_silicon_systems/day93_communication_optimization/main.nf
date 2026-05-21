nextflow.enable.dsl=2

include { COMMUNICATION_OPTIMIZATION } from './modules/communication_optimization.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/recovery_propagation.tsv")

    results = COMMUNICATION_OPTIMIZATION(input_data)

    results.view { "Communication optimization: $it" }
}