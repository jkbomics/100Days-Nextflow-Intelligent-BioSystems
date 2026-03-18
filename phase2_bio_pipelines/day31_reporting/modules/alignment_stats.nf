process ALIGNMENT_STATS {

    label 'post_alignment'

    publishDir "results/alignment_stats", mode: 'copy'

    input:
    tuple val(sample), path(bam), path(bai)

    output:
    path "${sample}_flagstat.txt"

    script:
    """
    samtools flagstat ${bam} > ${sample}_flagstat.txt
    """
}