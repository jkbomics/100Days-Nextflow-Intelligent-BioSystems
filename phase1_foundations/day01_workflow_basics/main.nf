nextflow.enable.dsl=2

/*
 * Day 01 – Workflow Fundamentals
 * Minimal DSL2 example
 * Demonstrates process definition and workflow orchestration
 */

process GREETING {

    tag "day01"

    output:
    stdout

    script:
    """
    echo "Hello Nextflow — Day 1 of 100"
    echo "Workflow execution time: $(date)"
    """
}

workflow {

    /*
     * The workflow block orchestrates execution.
     * Even a single process must be explicitly invoked.
     */

    GREETING()
}
