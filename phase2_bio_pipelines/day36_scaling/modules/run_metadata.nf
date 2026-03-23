process RUN_METADATA {

    label 'post_processing'

    publishDir "results/run_metadata", mode: 'copy'

    input:
    val run_name

    output:
    path "run_info.txt"

    script:
    """
    echo "Run Name: ${run_name}" > run_info.txt
    echo "Date: $(date)" >> run_info.txt
    echo "User: $(whoami)" >> run_info.txt
    echo "System: $(uname -a)" >> run_info.txt
    echo "Nextflow Version: ${workflow.nextflow.version}" >> run_info.txt
    echo "Project Dir: ${workflow.projectDir}" >> run_info.txt
    echo "Work Dir: ${workflow.workDir}" >> run_info.txt
    """
}