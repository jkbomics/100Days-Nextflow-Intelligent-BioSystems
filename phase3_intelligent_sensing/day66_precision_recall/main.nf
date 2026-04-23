nextflow.enable.dsl=2

include { PR_MODEL } from './modules/pr_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = PR_MODEL(input_data)

    results.view { "PR output: $it" }
}