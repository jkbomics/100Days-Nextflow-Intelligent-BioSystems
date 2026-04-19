nextflow.enable.dsl=2

include { SHAP_MODEL } from './modules/shap_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = SHAP_MODEL(input_data)

    results.view { "SHAP output: $it" }
}