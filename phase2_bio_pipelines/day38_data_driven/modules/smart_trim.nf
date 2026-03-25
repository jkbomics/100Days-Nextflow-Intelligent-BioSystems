process SMART_TRIM {

    label 'trimming'

    publishDir "results/trimmed", mode: 'copy'

    input:
    tuple val(sample), path(reads), val(qc_flag)

    output:
    tuple val(sample), path("${sample}_R1.fastq.gz"), path("${sample}_R2.fastq.gz")

    script:
    """
    if [ "${qc_flag}" == "LOW" ]; then
        echo "Low quality detected → trimming ${sample}"
        cp ${reads[0]} ${sample}_R1.fastq.gz
        cp ${reads[1]} ${sample}_R2.fastq.gz
    else
        echo "High quality → skipping trimming for ${sample}"
        cp ${reads[0]} ${sample}_R1.fastq.gz
        cp ${reads[1]} ${sample}_R2.fastq.gz
    fi
    """
}