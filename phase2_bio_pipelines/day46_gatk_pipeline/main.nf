nextflow.enable.dsl=2

include { BWA_ALIGN } from './modules/bwa_align.nf'
include { SAMTOOLS_SORT } from './modules/samtools_sort.nf'
include { SAMTOOLS_INDEX } from './modules/samtools_index.nf'
include { MARK_DUPLICATES } from './modules/mark_duplicates.nf'
include { GATK_HAPLOTYPECALLER } from './modules/gatk_haplotypecaller.nf'
include { GATK_INDEX } from './modules/gatk_index.nf'

workflow {

    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    aligned = BWA_ALIGN(reads)

    sorted = SAMTOOLS_SORT(aligned)

    indexed = SAMTOOLS_INDEX(sorted)

    dedup = MARK_DUPLICATES(indexed)

    vcf = GATK_HAPLOTYPECALLER(dedup)

    indexed_vcf = GATK_INDEX(vcf)

}