process SMOTE_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/smote", mode: 'copy'

    input:
    path input_file

    output:
    path "smote_report.txt"

    script:
    """
    python ${projectDir}/scripts/smote_model.py
    """
}