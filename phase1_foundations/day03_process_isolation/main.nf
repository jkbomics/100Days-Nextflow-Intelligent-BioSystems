nextflow.enable.dsl=2

/*
 * Day 03 – Process Isolation & Modular Design
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

process NORMALIZE_DATA {

    input:
    stdin

    output:
    stdout

    script:
    """
    awk '{print tolower(\$0)}'
    """
}

process SUMMARIZE_DATA {

    input:
    stdin

    output:
    stdout

    script:
    """
    echo "Line count:"
    wc -l
    """
}

workflow {

    input_channel = Channel.fromPath("input/sample.txt")

    processed = input_channel \
                | LOAD_DATA \
                | NORMALIZE_DATA \
                | SUMMARIZE_DATA

    processed.view()
}