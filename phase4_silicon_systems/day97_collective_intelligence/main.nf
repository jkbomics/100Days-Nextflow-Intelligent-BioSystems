nextflow.enable.dsl=2

include { COLLECTIVE_INTELLIGENCE } from './modules/collective_intelligence.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/meta_adaptation.tsv")

    results = COLLECTIVE_INTELLIGENCE(input_data)

    results.view { "Collective intelligence: $it" }
}