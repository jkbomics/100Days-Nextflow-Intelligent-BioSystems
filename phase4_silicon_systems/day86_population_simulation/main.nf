nextflow.enable.dsl=2

include { POPULATION_MODEL } from './modules/population_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/evolutionary_adaptation.tsv")

    results = POPULATION_MODEL(input_data)

    results.view { "Population simulation: $it" }
}