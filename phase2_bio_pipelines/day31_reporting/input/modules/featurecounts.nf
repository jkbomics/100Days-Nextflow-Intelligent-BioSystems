process FEATURECOUNTS {

    label 'quantification'

    publishDir "results/counts", mode: 'copy'

    input:
    tuple val(sample), path(bam)

    output:
    path "gene_counts.txt"

    script:
    """
    featureCounts \
        -T ${task.cpus} \
        -a ${params.annotation} \
        -o gene_counts.txt \
        ${bam}
    """
}