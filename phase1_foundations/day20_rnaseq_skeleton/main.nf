nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { TRIM_READS } from './modules/trim_reads.nf'
include { ALIGN_READS } from './modules/align_reads.nf'
include { COUNT_GENES } from './modules/count_genes.nf'

workflow {

    /*
     * Paired-end FASTQ detection
     */
    reads = Channel.fromFilePairs("${projectDir}/input/*_{R1,R2}.fastq.gz")

    qc_results = FASTQC(reads)

    trimmed_reads = TRIM_READS(reads)

    aligned = ALIGN_READS(trimmed_reads)

    counts = COUNT_GENES(aligned)

    counts.view()
}