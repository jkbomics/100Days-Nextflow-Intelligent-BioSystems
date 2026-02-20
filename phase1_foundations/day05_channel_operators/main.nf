nextflow.enable.dsl=2

/*
 * Day 05 – Channel Operators: Filtering & Transformation
 */

workflow {

    /*
     * Emit expression file
     */
    expression_channel = Channel
        .fromPath("${projectDir}/input/expression.txt")
        .splitText()

    /*
     * Transform each line into structured tuple
     */
    structured = expression_channel.map { line ->
        def parts = line.tokenize()
        tuple(parts[0], parts[1] as Integer)
    }

    /*
     * Filter high-expression genes (threshold > 40)
     */
    high_expression = structured.filter { gene, value ->
        value > 40
    }

    /*
     * Transform output format
     */
    formatted = high_expression.map { gene, value ->
        "${gene} is highly expressed (${value})"
    }

    /*
     * Collect final results
     */
    formatted.view()
}