nextflow.enable.dsl=2

/*
 * Include module
 */
include { SIGNAL_SIMULATION } from './modules/signal_simulation.nf'

/*
 * Workflow definition
 */
workflow {

    /*
     * Run signal simulation
     */
    signal_output = SIGNAL_SIMULATION()

    /*
     * Optional: visualize/log output
     */
    signal_output.view { file -> "Generated signal file: ${file}" }

}