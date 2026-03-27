nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { UPDATE_STATE } from './modules/update_state.nf'

workflow {

    /*
     * Load processed samples (state)
     */
    def state_file = file("${projectDir}/state/processed_samples.txt")

    def processed = state_file.exists()
        ? state_file.readLines().toSet()
        : [] as Set

    println "Previously processed samples: ${processed}"

    /*
     * Load input reads
     */
    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    /*
     * Filter new samples
     */
    new_reads = reads.filter { sample, files ->
        !processed.contains(sample)
    }

    new_reads.view { "Processing NEW sample: $it" }

    /*
     * Run QC on new samples
     */
    qc = FASTQC(new_reads)

    /*
     * Extract processed sample names
     */
    processed_samples = qc.map { sample, reads -> sample }

    /*
     * Update state
     */
    UPDATE_STATE(processed_samples)

}