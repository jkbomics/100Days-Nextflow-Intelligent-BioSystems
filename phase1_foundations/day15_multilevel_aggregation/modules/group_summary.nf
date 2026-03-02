process GROUP_SUMMARY {

    input:
    tuple val(group), stdin

    output:
    tuple val(group), stdout

    script:
    """
    echo "Summary for ${group}:"
    wc -l
    """
}