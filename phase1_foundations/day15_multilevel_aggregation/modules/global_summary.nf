process GLOBAL_SUMMARY {

    input:
    stdin

    output:
    stdout

    script:
    """
    echo "Global total highly expressed genes:"
    wc -l
    """
}