nextflow.enable.dsl=2

/*
 * Day 04 – Channel Branching & Parallel Amplification
 */

process LOAD_DATA {

    input:
    path file

    output:
    stdout

    script:
    """
    cat ${file}
    """
}

process TO_UPPER {

    input:
    stdin

    output:
    stdout

    script:
    """
    awk '{print toupper(\$0)}'
    """
}

process COUNT_LINES {

    input:
    stdin

    output:
    stdout

    script:
    """
    echo "Total genes:"
    wc -l
    """
}

workflow {

    /*
     * Emit input file
     */
    input_channel = Channel.fromPath("input/sample.txt")

    /*
     * First transformation
     */
    loaded = LOAD_DATA(input_channel)

    /*
     * Branching in DSL2
     * The same channel can feed multiple processes
     */
    upper_result = TO_UPPER(loaded)
    count_result = COUNT_LINES(loaded)

    /*
     * View outputs
     */
    upper_result.view()
    count_result.view()
}