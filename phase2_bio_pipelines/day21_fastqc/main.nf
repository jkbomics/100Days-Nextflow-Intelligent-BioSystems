nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'

workflow {

    reads = Channel.fromFilePairs("${projectDir}/input/*_{R1,R2}.fastq.gz")

    qc_results = FASTQC(reads)

}