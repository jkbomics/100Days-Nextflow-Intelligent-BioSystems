process KRAKEN2 {

    label 'classification'

    publishDir "results/kraken2", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    path "${sample}_report.txt"
    path "${sample}_output.txt"

    script:
    """
    kraken2 \
        --db ${params.kraken_db} \
        --paired ${reads[0]} ${reads[1]} \
        --report ${sample}_report.txt \
        --output ${sample}_output.txt
    """
}