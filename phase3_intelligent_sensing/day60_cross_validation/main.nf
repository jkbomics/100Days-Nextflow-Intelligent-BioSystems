nextflow.enable.dsl=2

include { CROSSVAL_MODEL } from './modules/crossval_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = CROSSVAL_MODEL(input_data)

    results.view { "Cross-validation results: $it" }
}