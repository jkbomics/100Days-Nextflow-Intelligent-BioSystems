nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { TRIM_GALORE } from './modules/trim_galore.nf'
include { STAR_ALIGN } from './modules/star_align.nf'
include { FEATURECOUNTS } from './modules/featurecounts.nf'

workflow {

    reads = Channel.fromFilePairs("${projectDir}/input/*_{R1,R2}.fastq.gz")

    qc_initial = FASTQC(reads)

    trimmed = TRIM_GALORE(reads)

    aligned = STAR_ALIGN(trimmed)

    counts = FEATURECOUNTS(aligned)

    counts.view()
}