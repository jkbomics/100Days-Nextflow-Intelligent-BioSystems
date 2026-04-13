nextflow.enable.dsl=2

include { FEATURE_SELECTION } from './modules/feature_selection.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = FEATURE_SELECTION(input_data)

    results.view { "Selected features: $it" }
}