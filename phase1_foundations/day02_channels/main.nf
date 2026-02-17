nextflow.enable.dsl=2

/*
 * Day 02 – Channels as Signal Propagation
 */

process READ_SIGNAL {

    tag "$file"

    input:
    path file

    output:
    stdout

    script:
    """
    echo "Received signal from file: ${file}"
    cat ${file}
    """
}

process TRANSFORM_SIGNAL {

    input:
    stdin

    output:
    stdout

    script:
    """
    echo "Transforming signal..."
    awk '{print toupper(\$0)}'
    """
}

workflow {

    /*
     * Channel emitting file as signal source
     */

    signal_channel = Channel.fromPath("input/sample.txt")

    /*
     * Propagation through processes
     */

    transformed = signal_channel | READ_SIGNAL | TRANSFORM_SIGNAL

    transformed.view()
}
