process TUMOR_ANALYSIS {

    label 'light_task'

    input:
    tuple val(group), path(file)

    output:
    stdout

    script:
    """
    echo "Running tumor-specific analysis on ${file}"
    wc -l ${file}
    """
}