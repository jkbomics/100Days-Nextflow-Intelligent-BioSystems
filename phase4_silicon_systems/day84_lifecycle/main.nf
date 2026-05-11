nextflow.enable.dsl=2

include { LIFECYCLE_MODEL } from './modules/lifecycle_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/self_healing.tsv")

    results = LIFECYCLE_MODEL(input_data)

    results.view { "Lifecycle simulation: $it" }
}