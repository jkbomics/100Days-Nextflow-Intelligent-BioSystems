nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { TRIM_GALORE } from './modules/trim_galore.nf'
include { STAR_ALIGN } from './modules/star_align.nf'
include { MULTIQC } from './modules/multiqc.nf'

workflow {

    reads = Channel.fromFilePairs("${projectDir}/input/*_{R1,R2}.fastq.gz")

    qc_initial = FASTQC(reads)

    trimmed = TRIM_GALORE(reads)

    aligned = STAR_ALIGN(trimmed)

    /*
     * Collect QC results for aggregation
     */
    qc_reports = qc_initial.collect()

    multiqc_report = MULTIQC(qc_reports)

}