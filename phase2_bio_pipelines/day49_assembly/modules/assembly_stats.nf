process ASSEMBLY_STATS {

    label 'analysis'

    publishDir "results/assembly_stats", mode: 'copy'

    input:
    tuple val(sample), path(contigs)

    output:
    path "${sample}_stats.txt"

    script:
    """
    echo "Assembly stats for ${sample}" > ${sample}_stats.txt
    echo "Number of contigs:" >> ${sample}_stats.txt
    grep -c ">" ${contigs} >> ${sample}_stats.txt
    """
}