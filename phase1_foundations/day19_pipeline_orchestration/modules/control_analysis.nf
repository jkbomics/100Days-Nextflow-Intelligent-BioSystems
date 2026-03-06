process CONTROL_ANALYSIS {

    label 'analysis_task'

    input:
    tuple val(group), path(file), val(threshold)

    output:
    stdout

    script:
    """
    echo "Control analysis on ${file} with threshold ${threshold}"
    awk '{ if (\$2 > ${threshold}) print \$1 }' ${file}
    """
}