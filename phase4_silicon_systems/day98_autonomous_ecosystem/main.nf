nextflow.enable.dsl=2

include { ECOSYSTEM_MODEL } from './modules/ecosystem_model.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/collective_intelligence.tsv")

    results = ECOSYSTEM_MODEL(input_data)

    results.view { "Autonomous ecosystem: $it" }
}