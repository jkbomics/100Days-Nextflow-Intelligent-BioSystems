process PR_MODEL {

    label 'analysis'

    publishDir "${projectDir}/results/pr", mode: 'copy'

    input:
    path input_file

    output:
    path "pr_values.tsv"
    path "pr_curve.png"

    script:
    """
    python ${projectDir}/scripts/pr_model.py
    """
}