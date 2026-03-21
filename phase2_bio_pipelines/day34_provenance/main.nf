nextflow.enable.dsl=2


/*
 * Import validation
 */
include { validateParams } from './lib/validation.groovy'

workflow {

    /*
     * Validate parameters BEFORE execution
     */
    validateParams(params)

    println "Starting RNA-Seq pipeline..."

/*
 * Import all modules from previous days
 */

include { FASTQC }            from './modules/fastqc.nf'
include { TRIM_GALORE }       from './modules/trim_galore.nf'
include { STAR_ALIGN }        from './modules/star_align.nf'
include { BAM_INDEX }         from './modules/bam_index.nf'
include { ALIGNMENT_STATS }   from './modules/alignment_stats.nf'
include { FEATURECOUNTS }     from './modules/featurecounts.nf'
include { FORMAT_COUNTS }     from './modules/expression_matrix.nf'
include { DESIGN_MATRIX }     from './modules/design_matrix.nf'
include { DESEQ2_ANALYSIS }   from './modules/deseq2_analysis.nf'
include { ENRICHMENT_ANALYSIS } from './modules/enrichment_analysis.nf'
include { GENERATE_REPORT }   from './modules/report_generation.nf'
include { RUN_METADATA } from './modlules/run_metadata.nf'


workflow {

    /*
     * Input: Paired-end FASTQ files
     */
    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    /*
     * Step 1: Quality Control
     */
    qc = FASTQC(reads)

    /*
     * Step 2: Trimming
     */
    trimmed = TRIM_GALORE(reads)

    /*
     * Step 3: Alignment
     */
    aligned = STAR_ALIGN(trimmed)

    /*
     * Step 4: Post-alignment processing
     */
    indexed = BAM_INDEX(aligned)

    stats = ALIGNMENT_STATS(indexed)

    /*
     * Step 5: Quantification
     */
    bam_files = indexed.map { sample, bam, bai -> bam }.collect()

    counts = FEATURECOUNTS(bam_files)

    /*
     * Step 6: Expression matrix formatting
     */
    matrix = FORMAT_COUNTS(counts)

    /*
     * Step 7: Metadata → Design matrix
     */
    metadata = Channel.fromPath("${params.metadata}")

    design = DESIGN_MATRIX(metadata)

    /*
     * Step 8: Differential expression
     */
    diffexp = DESEQ2_ANALYSIS(matrix, design)

    /*
     * Step 9: Functional enrichment
     */
    enrichment = ENRICHMENT_ANALYSIS(diffexp)

    /*
     * Step 10: Final report
     */
    report = GENERATE_REPORT(enrichment)

    /*
     * Capture run metadata
     */
    run_name = workflow.runName

    metadata = RUN_METADATA(run_name)

}