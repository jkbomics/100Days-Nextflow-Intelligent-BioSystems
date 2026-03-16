process FORMAT_COUNTS {

    label 'post_processing'

    publishDir "results/expression_matrix", mode: 'copy'

    input:
    path counts_file

    output:
    path "expression_matrix.tsv"

    script:
    """
    # Remove featureCounts comment lines
    grep -v '^#' ${counts_file} > tmp.txt

    # Extract gene ID and sample columns
    cut -f1,7- tmp.txt > expression_matrix.tsv
    """
}