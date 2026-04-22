nextflow.enable.dsl=2

include { ROC_MODEL } from './modules/roc_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = ROC_MODEL(input_data)

    results.view { "ROC output: $it" }
}