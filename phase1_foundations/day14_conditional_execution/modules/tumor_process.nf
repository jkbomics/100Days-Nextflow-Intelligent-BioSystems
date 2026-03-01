process TUMOR_ANALYSIS {

    label 'light_task'

    input:
    tuple val(group), path(file)

    output:
    stdout

    script:
    """
    echo "Tumor-specific analysis for ${file}"
    wc -l ${file}
    """
}