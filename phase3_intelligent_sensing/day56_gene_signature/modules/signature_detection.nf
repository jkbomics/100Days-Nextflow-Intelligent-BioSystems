process SIGNATURE_DETECTION {

    label 'analysis'

    publishDir "${projectDir}/results/signature", mode: 'copy'

    input:
    path input_file

    output:
    path "gene_signature.tsv"

    script:
    """
    python ${projectDir}/scripts/signature_detection.py
    """
}