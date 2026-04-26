nextflow.enable.dsl=2

include { FEATURE_SELECTION } from './modules/feature_selection.nf'
include { PREDICTION } from './modules/prediction.nf'
include { DECISION } from './modules/decision.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    selected = FEATURE_SELECTION(input_data)

    pred = PREDICTION(input_data)

    decision = DECISION(pred)

    decision.view { "Final output: $it" }
}