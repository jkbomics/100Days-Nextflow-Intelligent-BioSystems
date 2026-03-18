process BAM_INDEX {

    label 'post_alignment'

    publishDir "results/bam_index", mode: 'copy'

    input:
    tuple val(sample), path(bam)

    output:
    tuple val(sample), path(bam), path("${bam}.bai")

    script:
    """
    samtools index ${bam}
    """
}