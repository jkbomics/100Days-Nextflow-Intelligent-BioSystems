process FILTER_GENES {

    label 'light_task'

    input:
    tuple val(group), path(file)
    val threshold

    output:
    tuple val(group), stdout

    script:
    """
    awk '{ if (\$2 > ${threshold}) print \$1 }' ${file}
    """
}