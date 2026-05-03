process SILICON_SIMULATION {

    publishDir "${projectDir}/results/silicon", mode: 'copy'

    input:
    path input_file

    output:
    path "silicon_stream.tsv"

    script:
    """
    cp ${input_file} base_signal.tsv
    python ${projectDir}/scripts/silicon_simulation.py
    """
}