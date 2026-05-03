nextflow.enable.dsl=2

include { SILICON_SIMULATION } from './modules/silicon_simulation.nf'

workflow {

    input_data = Channel.fromPath("${projectDir}/input/base_signal.tsv")

    results = SILICON_SIMULATION(input_data)

    results.view { "Silicon stream: $it" }
}