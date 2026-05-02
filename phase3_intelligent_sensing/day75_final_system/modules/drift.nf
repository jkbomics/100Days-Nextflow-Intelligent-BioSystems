process DRIFT {

    publishDir "${projectDir}/results", mode: 'copy'

    input:
    path input_file

    output:
    path "drift.tsv"

    script:
    """
    cp ${input_file} streaming.tsv
    python ${projectDir}/scripts/drift.py
    """
}