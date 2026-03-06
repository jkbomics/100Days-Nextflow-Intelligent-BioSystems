nextflow.enable.dsl=2

include { QC_CHECK } from './modules/qc_module.nf'
include { TUMOR_ANALYSIS } from './modules/tumor_analysis.nf'
include { CONTROL_ANALYSIS } from './modules/control_analysis.nf'

workflow {

    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    /*
     * Attach metadata + adaptive parameters
     */
    tagged = samples.map { file ->

        def group = file.name.contains("tumor") ? "tumor" : "control"

        def threshold = group == "tumor" ? 40 : 20

        tuple(group, file, threshold)
    }

    /*
     * QC step for all samples
     */
    qc_results = QC_CHECK(samples)

    /*
     * Dynamic orchestration
     */
    tumor_ch   = tagged.filter { group, file, thr -> group == "tumor" }
    control_ch = tagged.filter { group, file, thr -> group == "control" }

    tumor_results   = TUMOR_ANALYSIS(tumor_ch)
    control_results = CONTROL_ANALYSIS(control_ch)

    qc_results.view()
    tumor_results.view()
    control_results.view()
}