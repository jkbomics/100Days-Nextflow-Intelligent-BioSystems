nextflow.enable.dsl=2

include { UNIFIED_ARCHITECTURE } from './modules/unified_architecture.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/self_sustaining_intelligence.tsv")

    results = UNIFIED_ARCHITECTURE(input_data)

    results.view { "Unified adaptive architecture: $it" }
}