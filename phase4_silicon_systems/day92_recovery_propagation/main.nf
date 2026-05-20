nextflow.enable.dsl=2

include { RECOVERY_PROPAGATION } from './modules/recovery_propagation.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/node_resilience.tsv")

    results = RECOVERY_PROPAGATION(input_data)

    results.view { "Recovery propagation: $it" }
}