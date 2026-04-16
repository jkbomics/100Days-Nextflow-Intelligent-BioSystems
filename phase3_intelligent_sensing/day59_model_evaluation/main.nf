nextflow.enable.dsl=2

include { EVALUATION_MODEL } from './modules/evaluation_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/expression_matrix.tsv")

    results = EVALUATION_MODEL(input_data)

    results.view { "Evaluation output: $it" }
}