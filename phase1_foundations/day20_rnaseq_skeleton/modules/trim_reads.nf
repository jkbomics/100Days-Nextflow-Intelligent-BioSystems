process TRIM_READS {

    label 'light_task'

    input:
    tuple val(sample), path(reads)

    output:
    tuple val(sample), path("${sample}_trim_R1.fastq.gz"), path("${sample}_trim_R2.fastq.gz")

    script:
    """
    echo "Trimming reads for ${sample}"

    cp ${reads[0]} ${sample}_trim_R1.fastq.gz
    cp ${reads[1]} ${sample}_trim_R2.fastq.gz
    """
}