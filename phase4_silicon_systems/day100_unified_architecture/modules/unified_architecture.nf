process UNIFIED_ARCHITECTURE {

    publishDir "${projectDir}/results/unified_architecture", mode: 'copy'

    input:
    path input_file

    output:
    path "unified_adaptive_architecture.tsv"

    script:
    """
    cp ${input_file} self_sustaining_intelligence.tsv
    python ${projectDir}/scripts/unified_architecture.py
    """
}