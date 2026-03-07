process COUNT_GENES {

    label 'analysis'

    input:
    tuple val(sample), path(bam)

    output:
    stdout

    script:
    """
    echo "Counting genes for ${sample}"
    echo "GeneA 50"
    echo "GeneB 30"
    """
}