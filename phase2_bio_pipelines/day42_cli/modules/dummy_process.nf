process DUMMY_PROCESS {

    label 'compute'

    publishDir "results/processed", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    path "${sample}.txt"

    script:
    """
    echo "Processed ${sample}" > ${sample}.txt
    """
}