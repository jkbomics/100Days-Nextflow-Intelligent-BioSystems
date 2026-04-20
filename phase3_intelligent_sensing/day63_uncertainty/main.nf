nextflow.enable.dsl=2

include { UNCERTAINTY_MODEL } from './modules/uncertainty_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = UNCERTAINTY_MODEL(input_data)

    results.view { "Uncertainty output: $it" }
}