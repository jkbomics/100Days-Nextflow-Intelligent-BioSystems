nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { BWA_ALIGN } from './modules/bwa_align.nf'
include { SAMTOOLS_SORT } from './modules/samtools_sort.nf'
include { VARIANT_CALL } from './modules/variant_call.nf'

workflow {

    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    /*
     * Step 1: QC
     */
    qc = FASTQC(reads)

    /*
     * Step 2: Alignment
     */
    aligned = BWA_ALIGN(reads)

    /*
     * Step 3: Sorting BAM
     */
    sorted = SAMTOOLS_SORT(aligned)

    /*
     * Step 4: Variant Calling
     */
    vcf = VARIANT_CALL(sorted)

}