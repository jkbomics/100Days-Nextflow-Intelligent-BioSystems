nextflow.enable.dsl=2

include { SELF_SUSTAINING } from './modules/self_sustaining.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/autonomous_ecosystem.tsv")

    results = SELF_SUSTAINING(input_data)

    results.view { "Self-sustaining intelligence: $it" }
}