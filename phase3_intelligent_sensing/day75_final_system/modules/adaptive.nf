process ADAPTIVE {

    publishDir "${projectDir}/results", mode: 'copy'

    input:
    path input_file

    output:
    path "adaptive.tsv"

    script:
    """
    cp ${input_file} streaming.tsv
    python ${projectDir}/scripts/adaptive.py
    """
}