process DWGSIM {
    tag "$meta.id"
    label 'process_medium'

    container 'community.wave.seqera.io/library/dwgsim:1.1.14--b4033839f1e4b148'

    input:
    tuple val(meta), path(fasta)

    output:
    tuple val(meta), path("${prefix}_R{1,2}.fastq.gz"), emit: reads
    tuple val(meta), path("${prefix}.mutations.vcf") , emit: vcf
    path "versions.yml"                              , emit: versions

    script:
    def args = task.ext.args ?: ''
    prefix   = task.ext.prefix ?: "${meta.id}_illumina"
    """
    dwgsim \\
        $args \\
        -N ${params.illumina_read_pairs} \\
        -z ${params.seed} \\
        $fasta \\
        $prefix

    # Prefix read names with the sample ID so reads stay traceable once pooled.
    # DWGSIM names already carry contig, positions and error counts.
    for r in 1 2; do
        zcat ${prefix}.bwa.read\${r}.fastq.gz \\
            | awk -v p='${meta.id}|' 'NR % 4 == 1 { sub(/^@/, "@" p) } 1' \\
            | gzip > ${prefix}_R\${r}.fastq.gz
    done
    rm ${prefix}.bwa.read*.fastq.gz ${prefix}.mutations.txt

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        dwgsim: \$(dwgsim 2>&1 | awk '/^Version:/ { print \$2 }')
    END_VERSIONS
    """
}