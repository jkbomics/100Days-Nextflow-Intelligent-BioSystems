nextflow.enable.dsl=2

params.threshold = params.threshold ?: 40

include { FILTER_GENES } from './modules/filter_genes.nf'
include { GROUP_SUMMARY } from './modules/group_summary.nf'
include { COMPARE_GROUPS } from './modules/compare_groups.nf'

workflow {

    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    tagged = samples.map { file ->
        def group = file.name.contains("tumor") ? "tumor" : "control"
        tuple(group, file)
    }

    filtered = FILTER_GENES(tagged, params.threshold)

    grouped = filtered.groupTuple()

    group_counts = GROUP_SUMMARY(grouped)

    /*
     * Extract just numeric counts
     */
    counts_only = group_counts.map { group, count ->
        count.trim()
    }

    /*
     * Collect into single comparison input
     */
    comparison_input = counts_only.collect()

    result = COMPARE_GROUPS(comparison_input)

    result.view()
}