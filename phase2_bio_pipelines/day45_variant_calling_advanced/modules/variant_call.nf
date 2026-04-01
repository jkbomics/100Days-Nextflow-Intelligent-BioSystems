process VARIANT_CALL {

    label 'variant'

    publishDir "results/vcf", mode: 'copy'

    input:
    tuple val(sample), path(bam)

    output:
    path "${sample}.vcf"

    script:
    """
    bcftools mpileup -f ${params.reference} ${bam} | \
    bcftools call -mv -Ov -o ${sample}.vcf
    """
}