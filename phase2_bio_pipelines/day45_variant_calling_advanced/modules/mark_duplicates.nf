process MARK_DUPLICATES {

    label 'processing'

    publishDir "results/deduplicated", mode: 'copy'

    input:
    tuple val(sample), path(bam), path(bai)

    output:
    tuple val(sample), path("${sample}_dedup.bam")

    script:
    """
    picard MarkDuplicates \
        I=${bam} \
        O=${sample}_dedup.bam \
        M=${sample}_metrics.txt \
        REMOVE_DUPLICATES=true
    """
}