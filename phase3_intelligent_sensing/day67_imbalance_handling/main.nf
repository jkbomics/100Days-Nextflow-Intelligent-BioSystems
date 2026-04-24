nextflow.enable.dsl=2

include { IMBALANCE_MODEL } from './modules/imbalance_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = IMBALANCE_MODEL(input_data)

    results.view { "Imbalance output: $it" }
}