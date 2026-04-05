nextflow.enable.dsl=2

include { SPADES } from './modules/spades.nf'
include { ASSEMBLY_STATS } from './modules/assembly_stats.nf'

workflow {

    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    /*
     * Step 1: Assembly
     */
    contigs = SPADES(reads)

    /*
     * Step 2: Assembly statistics
     */
    stats = ASSEMBLY_STATS(contigs)

}