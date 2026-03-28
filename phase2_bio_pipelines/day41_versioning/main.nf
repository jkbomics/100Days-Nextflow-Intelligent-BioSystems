nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { DUMMY_PROCESS } from './modules/dummy_process.nf'

/*
 * Load version
 */
def version = file("${projectDir}/VERSION").text.trim()

workflow.onStart {
    println "======================================"
    println "Pipeline Version: ${version}"
    println "Run Name: ${workflow.runName}"
    println "Profile: ${workflow.profile}"
    println "======================================"
}

workflow {

    reads = Channel.fromFilePairs("${params.input}/*_{R1,R2}.fastq.gz")

    qc = FASTQC(reads)

    processed = DUMMY_PROCESS(qc)

}