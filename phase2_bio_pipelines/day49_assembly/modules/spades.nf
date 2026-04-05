process SPADES {

    label 'assembly'

    publishDir "results/spades", mode: 'copy'

    input:
    tuple val(sample), path(reads)

    output:
    tuple val(sample), path("contigs.fasta")

    script:
    """
    spades.py \
        -1 ${reads[0]} \
        -2 ${reads[1]} \
        -o spades_out

    cp spades_out/contigs.fasta contigs.fasta
    """
}