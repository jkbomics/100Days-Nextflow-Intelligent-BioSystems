process GATK_HAPLOTYPECALLER {

    label 'variant'

    publishDir "results/gatk_vcf", mode: 'copy'

    input:
    tuple val(sample), path(bam)

    output:
    path "${sample}.vcf"

    script:
    """
    gatk HaplotypeCaller \
        -R ${params.reference} \
        -I ${bam} \
        -O ${sample}.vcf
    """
}