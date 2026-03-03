process COMPARE_GROUPS {

    input:
    stdin

    output:
    stdout

    script:
    """
    read tumor control
    diff=$((tumor - control))

    echo "Tumor count: $tumor"
    echo "Control count: $control"
    echo "Difference (Tumor - Control): $diff"
    """
}