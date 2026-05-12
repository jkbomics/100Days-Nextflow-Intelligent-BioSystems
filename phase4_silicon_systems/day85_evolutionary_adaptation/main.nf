nextflow.enable.dsl=2

include { EVOLUTIONARY_MODEL } from './modules/evolutionary_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/lifecycle_simulation.tsv")

    results = EVOLUTIONARY_MODEL(input_data)

    results.view { "Evolutionary adaptation: $it" }
}