process DESIGN_MATRIX {

    label 'post_processing'

    publishDir "results/design_matrix", mode: 'copy'

    input:
    path metadata

    output:
    path "design_matrix.tsv"

    script:
    """
    awk -F',' 'NR>1 {print $1"\t"$2}' ${metadata} > design_matrix.tsv
    """
}