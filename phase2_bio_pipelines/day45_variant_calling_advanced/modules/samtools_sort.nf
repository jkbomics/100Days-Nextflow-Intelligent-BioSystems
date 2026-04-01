process SAMTOOLS_SORT {

    label 'processing'

    publishDir "results/bam", mode: 'copy'

    input:
    tuple val(sample), path(sam)

    output:
    tuple val(sample), path("${sample}.bam")

    script:
    """
    samtools view -Sb ${sam} | samtools sort -o ${sample}.bam
    """
}