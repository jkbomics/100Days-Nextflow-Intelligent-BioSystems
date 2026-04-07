process SIGNAL_SIMULATION {

    label 'simulation'

    publishDir "results/signal", mode: 'copy'

    output:
    path "signal_expression.tsv"

    script:
    """
    python ${projectDir}/scripts/simulate_signal.py
    """
}