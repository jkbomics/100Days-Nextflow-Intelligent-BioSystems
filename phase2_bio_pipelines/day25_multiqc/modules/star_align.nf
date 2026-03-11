process STAR_ALIGN {

    label 'alignment'

    publishDir "results/alignment", mode: 'copy'

    input:
    tuple val(sample), path(r1), path(r2)

    output:
    tuple val(sample), path("${sample}.bam")

    script:
    """
    STAR \
      --genomeDir ${params.star_index} \
      --readFilesIn ${r1} ${r2} \
      --readFilesCommand zcat \
      --runThreadN ${task.cpus} \
      --outSAMtype BAM SortedByCoordinate \
      --outFileNamePrefix ${sample}_

    mv ${sample}_Aligned.sortedByCoord.out.bam ${sample}.bam
    """
}