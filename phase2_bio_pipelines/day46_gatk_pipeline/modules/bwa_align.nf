process BWA_ALIGN {

    label 'alignment'

    publishDir "results/aligned", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    tuple val(sample), path("${sample}.sam")

    script:
    """
    bwa mem ${params.reference} ${reads[0]} ${reads[1]} > ${sample}.sam
    """
}