nextflow.enable.dsl=2

include { THRESHOLD_MODEL } from './modules/threshold_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = THRESHOLD_MODEL(input_data)

    results.view { "Threshold tuning output: $it" }
}