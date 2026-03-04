nextflow.enable.dsl=2

include { ADAPTIVE_FILTER } from './modules/adaptive_filter.nf'

workflow {

    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    /*
     * Attach metadata + adaptive thresholds
     */
    tagged = samples.map { file ->

        def group = file.name.contains("tumor") ? "tumor" : "control"

        def threshold = group == "tumor" ? 40 : 20

        tuple(group, file, threshold)
    }

    filtered = ADAPTIVE_FILTER(tagged)

    filtered.view()
}