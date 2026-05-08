nextflow.enable.dsl=2

include { RESOURCE_ADAPTATION } from './modules/resource_adaptation.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/system_coordination.tsv")

    results = RESOURCE_ADAPTATION(input_data)

    results.view { "Resource adaptation: $it" }
}