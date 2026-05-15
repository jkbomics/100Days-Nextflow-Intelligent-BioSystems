nextflow.enable.dsl=2

include { SELECTION_MODEL } from './modules/selection_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/population_simulation.tsv")

    results = SELECTION_MODEL(input_data)

    results.view { "Selection results: $it" }
}