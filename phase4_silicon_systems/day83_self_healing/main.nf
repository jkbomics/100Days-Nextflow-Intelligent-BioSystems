nextflow.enable.dsl=2

include { SELF_HEALING } from './modules/self_healing.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/predictive_failure.tsv")

    results = SELF_HEALING(input_data)

    results.view { "Self-healing output: $it" }
}