nextflow.enable.dsl=2

include { HIERARCHICAL_MODEL } from './modules/hierarchical_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/self_organized_network.tsv")

    results = HIERARCHICAL_MODEL(input_data)

    results.view { "Hierarchical intelligence: $it" }
}