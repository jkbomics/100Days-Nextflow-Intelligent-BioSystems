nextflow.enable.dsl=2

include { PREDICTIVE_FAILURE } from './modules/predictive_failure.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/resource_adaptation.tsv")

    results = PREDICTIVE_FAILURE(input_data)

    results.view { "Predictive failure output: $it" }
}