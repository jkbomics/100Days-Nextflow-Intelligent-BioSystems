nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { SMART_TRIM } from './modules/smart_trim.nf'
include { STAR_ALIGN } from './modules/star_align.nf'

workflow {

    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    /*
     * Step 1: QC
     */
    qc_results = FASTQC(reads)

    /*
     * Step 2: Simulated QC signal extraction
     * (In real case: parse FastQC output)
     */
    qc_flagged = qc_results.map { sample, reads ->
        def flag = sample.contains("bad") ? "LOW" : "HIGH"
        tuple(sample, reads, flag)
    }

    /*
     * Step 3: Conditional trimming
     */
    processed = SMART_TRIM(qc_flagged)

    /*
     * Step 4: Alignment
     */
    aligned = STAR_ALIGN(processed)

}