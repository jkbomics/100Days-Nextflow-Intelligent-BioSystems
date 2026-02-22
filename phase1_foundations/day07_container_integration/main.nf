nextflow.enable.dsl=2

/*
 * Day 07 – Container Integration
 */

params.threshold = params.threshold ?: 40

process FILTER_GENES {

    container 'ubuntu:22.04'

    input:
    path file

    output:
    stdout

    script:
    """
    awk '{ if (\$2 > ${params.threshold}) print \$1 " is highly expressed (" \$2 ")" }' ${file}
    """
}

workflow {

    println "Using threshold: ${params.threshold}"

    input_channel = Channel.fromPath("${projectDir}/input/expression.txt")

    result = FILTER_GENES(input_channel)

    result.view()
}