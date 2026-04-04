process KRONA {

    label 'visualization'

    publishDir "results/krona", mode: 'copy'

    input:
    path report

    output:
    path "taxonomy.html"

    script:
    """
    cut -f2,3 ${report} > krona_input.txt

    ktImportText krona_input.txt -o taxonomy.html
    """
}