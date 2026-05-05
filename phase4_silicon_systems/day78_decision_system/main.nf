nextflow.enable.dsl=2

include { DECISION_SYSTEM } from './modules/decision_system.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/silicon_anomalies.tsv")

    results = DECISION_SYSTEM(input_data)

    results.view { "Decision output: $it" }
}