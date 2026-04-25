nextflow.enable.dsl=2

include { SMOTE_MODEL } from './modules/smote_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = SMOTE_MODEL(input_data)

    results.view { "SMOTE output: $it" }
}