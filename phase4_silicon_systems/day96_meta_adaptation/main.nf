nextflow.enable.dsl=2

include { META_ADAPTATION } from './modules/meta_adaptation.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/hierarchical_intelligence.tsv")

    results = META_ADAPTATION(input_data)

    results.view { "Meta adaptation: $it" }
}