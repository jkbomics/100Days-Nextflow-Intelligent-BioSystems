nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { TRIM_GALORE } from './modules/trim_galore.nf'

workflow {

    reads = Channel.fromFilePairs("${projectDir}/input/*_{R1,R2}.fastq.gz")

    /*
     * Initial QC
     */
    qc_initial = FASTQC(reads)

    /*
     * Adapter trimming
     */
    trimmed = TRIM_GALORE(reads)

}