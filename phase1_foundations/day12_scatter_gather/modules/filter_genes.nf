process FILTER_GENES {

    label 'light_task'

    input:
    path file
    val threshold

    output:
    stdout

    script:
    """
    awk '{ if (\$2 > ${threshold}) print \$1 " is highly expressed (" \$2 ")" }' ${file}
    """
}