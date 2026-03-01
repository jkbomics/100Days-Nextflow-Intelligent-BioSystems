process CONTROL_ANALYSIS {

    label 'light_task'

    input:
    tuple val(group), path(file)

    output:
    stdout

    script:
    """
    echo "Control-specific analysis for ${file}"
    wc -l ${file}
    """
}