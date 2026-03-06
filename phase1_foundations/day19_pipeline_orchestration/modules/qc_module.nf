process QC_CHECK {

    label 'light_task'

    input:
    path file

    output:
    stdout

    script:
    """
    echo "QC check for ${file}"
    wc -l ${file}
    """
}