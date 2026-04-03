nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { KRAKEN2 } from './modules/kraken2.nf'

workflow {

    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    /*
     * Step 1: QC
     */
    qc = FASTQC(reads)

    /*
     * Step 2: Taxonomic Classification
     */
    taxonomy = KRAKEN2(reads)

}