nextflow.enable.dsl=2

include { EMERGENCE_MODEL } from './modules/emergence_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/selection_results.tsv")

    results = EMERGENCE_MODEL(input_data)

    results.view { "Emergent behavior: $it" }
}