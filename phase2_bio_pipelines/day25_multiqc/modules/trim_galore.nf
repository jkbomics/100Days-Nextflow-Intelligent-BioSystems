process TRIM_GALORE {

    label 'trimming'

    publishDir "results/trimmed", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    tuple val(sample),
          path("${sample}_val_1.fq.gz"),
          path("${sample}_val_2.fq.gz")

    script:
    """
    trim_galore --paired ${reads[0]} ${reads[1]}
    """
}