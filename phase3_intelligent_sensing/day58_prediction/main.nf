nextflow.enable.dsl=2

include { PREDICTION_MODEL } from './modules/prediction_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = PREDICTION_MODEL(input_data)

    results.view { "Prediction output: $it" }
}