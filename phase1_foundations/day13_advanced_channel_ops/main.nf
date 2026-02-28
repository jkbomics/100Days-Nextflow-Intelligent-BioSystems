nextflow.enable.dsl=2

/*
 * Day 13 – Advanced Channel Operators
 */

params.threshold = params.threshold ?: 40

workflow {

    /*
     * Emit files
     */
    samples = Channel.fromPath("${projectDir}/input/sample*.txt")

    /*
     * Attach metadata based on filename
     */
    tagged = samples.map { file ->
        def group = file.name.contains("tumor") ? "tumor" : "control"
        tuple(group, file)
    }

    /*
     * Group samples by metadata
     */
    grouped = tagged.groupTuple()

    /*
     * Inspect grouped structure
     */
    grouped.view { group, files ->
        "Group: ${group} → ${files.size()} samples"
    }

}