nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { TRIM_GALORE } from './modules/trim_galore.nf'
include { STAR_ALIGN } from './modules/star_align.nf'
include { BAM_INDEX } from './modules/bam_index.nf'
include { ALIGNMENT_STATS } from './modules/alignment_stats.nf'
include { FEATURECOUNTS } from './modules/featurecounts.nf'
include { FORMAT_COUNTS } from './modules/expression_matrix.nf'

workflow {

    reads = Channel.fromFilePairs("${projectDir}/input/*_{R1,R2}.fastq.gz")

    qc = FASTQC(reads)

    trimmed = TRIM_GALORE(reads)

    aligned = STAR_ALIGN(trimmed)

    indexed = BAM_INDEX(aligned)

    stats = ALIGNMENT_STATS(indexed)

    bam_files = indexed.map { sample, bam, bai -> bam }.collect()

    counts = FEATURECOUNTS(bam_files)

    matrix = FORMAT_COUNTS(counts)

    matrix.view()

}