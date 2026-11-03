process PREPARE_REFERENCE {
    tag "$meta.id"

    container 'community.wave.seqera.io/library/seqkit:2.14.0--11e739c316bd874b'

    input:
    tuple val(meta), path(fasta)

    output:
    tuple val(meta), path("${prefix}.fa"), emit: fasta
    path "versions.yml"                  , emit: versions

    script:
    def args = task.ext.args ?: ''
    prefix   = task.ext.prefix ?: "${meta.id}"
    """
    # Both simulators need plain-text FASTA; uppercase removes soft-masking
    seqkit seq \\
        --upper-case \\
        --min-len ${params.min_contig_length} \\
        $args \\
        $fasta \\
        -o ${prefix}.fa

    if [[ ! -s ${prefix}.fa ]]; then
        echo "No contigs >= ${params.min_contig_length} bp in $fasta" >&2
        exit 1
    fi

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        seqkit: \$(seqkit version | sed 's/seqkit v//')
    END_VERSIONS
    """
}