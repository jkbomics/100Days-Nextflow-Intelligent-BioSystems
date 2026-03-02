nextflow.enable.dsl=2

params.threshold = params.threshold ?: 40

include { FILTER_GENES } from './modules/filter_genes.nf'
include { GROUP_SUMMARY } from './modules/group_summary.nf'
include { GLOBAL_SUMMARY } from './modules/global_summary.nf'

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
     * Scatter filtering
     */
    filtered = FILTER_GENES(tagged, params.threshold)

    /*
     * Group-level aggregation
     */
    grouped = filtered.groupTuple()

    group_summaries = GROUP_SUMMARY(grouped)

    /*
     * Global aggregation
     */
    global_input = filtered.map { group, result -> result }
                           .collect()

    global_summary = GLOBAL_SUMMARY(global_input)

    group_summaries.view()
    global_summary.view()
}