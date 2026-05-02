nextflow.enable.dsl=2

include { STREAMING } from './modules/streaming.nf'
include { ANOMALY } from './modules/anomaly.nf'
include { ADAPTIVE } from './modules/adaptive.nf'
include { DRIFT } from './modules/drift.nf'
include { DECISION } from './modules/decision.nf'

workflow {

    base = Channel.fromPath("${projectDir}/input/base_expression.tsv")

    stream = STREAMING(base)

    anomaly = ANOMALY(stream)
    adaptive = ADAPTIVE(stream)
    drift = DRIFT(stream)

    final = DECISION(anomaly, adaptive, drift)

    final.view()
}