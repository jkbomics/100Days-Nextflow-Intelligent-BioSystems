nextflow.enable.dsl=2

include { PATHWAY_ANALYSIS } from './modules/pathway_analysis.nf'

workflow {

    genes = Channel.fromPath("${params.input}")

    results = PATHWAY_ANALYSIS(genes)

}