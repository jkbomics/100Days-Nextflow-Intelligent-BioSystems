process ALIGN_READS {

    label 'heavy_task'

    input:
    tuple val(sample), path(r1), path(r2)

    output:
    tuple val(sample), path("${sample}.bam")

    script:
    """
    echo "Aligning sample ${sample}"

    touch ${sample}.bam
    """
}