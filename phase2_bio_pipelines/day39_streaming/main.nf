nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'

workflow {

    /*
     * Continuously watch for new files
     */
    reads = Channel
                .fromPath("${params.input}/*_{R1,R2}.fastq.gz", checkIfExists: true)
                .watchPath()

    reads.view { "New data detected: $it" }

    /*
     * Process as data arrives
     */
    qc = FASTQC(reads)

}