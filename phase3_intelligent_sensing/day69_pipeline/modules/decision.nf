process DECISION {

    label 'analysis'

    publishDir "${projectDir}/results/pipeline", mode: 'copy'

    input:
    path pred_file

    output:
    path "final_decision.tsv"

    script:
    """
    cp ${pred_file} prediction.tsv
    python ${projectDir}/scripts/decision.py
    """
}