nextflow.enable.dsl=2

/*
 * Day 06 – Parameterization & Dynamic Thresholds
 */

params.threshold = params.threshold ?: 40

workflow {

    println "Using expression threshold: ${params.threshold}"

    expression_channel = Channel
        .fromPath("${projectDir}/input/expression.txt")
        .splitText()

    structured = expression_channel.map { line ->
        def parts = line.tokenize()
        tuple(parts[0], parts[1] as Integer)
    }

    high_expression = structured.filter { gene, value ->
        value > params.threshold
    }

    formatted = high_expression.map { gene, value ->
        "${gene} is highly expressed (${value})"
    }

    formatted.view()
}