nextflow.enable.dsl=2

include { TUMOR_ANALYSIS } from './modules/tumor_process.nf'
include { CONTROL_ANALYSIS } from './modules/control_process.nf'

workflow {

    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    /*
     * Attach metadata
     */
    tagged = samples.map { file ->
        def group = file.name.contains("tumor") ? "tumor" : "control"
        tuple(group, file)
    }

    /*
     * Branch channel based on metadata
     */
    tumor_ch = tagged.filter { group, file -> group == "tumor" }
    control_ch = tagged.filter { group, file -> group == "control" }

    tumor_results   = TUMOR_ANALYSIS(tumor_ch)
    control_results = CONTROL_ANALYSIS(control_ch)

    tumor_results.view()
    control_results.view()
}