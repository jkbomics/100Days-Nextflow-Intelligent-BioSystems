process CONTROL_ANALYSIS {

    label 'light_task'

    input:
    tuple val(group), path(file)

    output:
    stdout

    script:
    """
    echo "Running control-specific analysis on ${file}"
    wc -l ${file}
    """
}