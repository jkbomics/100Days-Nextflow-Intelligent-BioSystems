process UPDATE_STATE {

    publishDir "${projectDir}/state", mode: 'copy', overwrite: true

    input:
    val sample

    output:
    path "processed_samples.txt"

    script:
    """
    touch processed_samples.txt

    if [ -f "${projectDir}/state/processed_samples.txt" ]; then
        cat ${projectDir}/state/processed_samples.txt >> processed_samples.txt
    fi

    echo ${sample} >> processed_samples.txt

    sort -u processed_samples.txt -o processed_samples.txt
    """
}