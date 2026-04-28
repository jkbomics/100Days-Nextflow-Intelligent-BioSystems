nextflow.enable.dsl=2

include { SIMULATION_MODEL } from './modules/simulation_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/gene_expression.tsv")

    results = SIMULATION_MODEL(input_data)

    results.view { "Simulation output: $it" }
}