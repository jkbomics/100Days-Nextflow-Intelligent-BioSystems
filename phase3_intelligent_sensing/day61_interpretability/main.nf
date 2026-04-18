nextflow.enable.dsl=2

include { INTERPRET_MODEL } from './modules/interpret_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = INTERPRET_MODEL(input_data)

    results.view { "Feature importance: $it" }
}