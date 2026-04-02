process GATK_INDEX {

    label 'variant'

    publishDir "results/gatk_vcf", mode: 'copy'

    input:
    path vcf

    output:
    path "${vcf}.idx"

    script:
    """
    gatk IndexFeatureFile -I ${vcf}
    """
}