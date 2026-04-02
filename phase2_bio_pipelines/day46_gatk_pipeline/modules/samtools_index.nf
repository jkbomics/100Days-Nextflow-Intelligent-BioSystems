process SAMTOOLS_INDEX {

    label 'processing'

    publishDir "results/indexed", mode: 'copy'

    input:
    tuple val(sample), path(bam)

    output:
    tuple val(sample), path(bam), path("${bam}.bai")

    script:
    """
    samtools index ${bam}
    """
}