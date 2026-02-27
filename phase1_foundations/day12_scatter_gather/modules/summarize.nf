process SUMMARIZE_RESULTS {

    input:
    stdin

    output:
    stdout

    script:
    """
    echo "Total highly expressed genes:"
    wc -l
    """
}