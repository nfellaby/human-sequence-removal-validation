process PBSIM {
    tag "$meta.id"
    label 'process_low'

    container 'community.wave.seqera.io/library/pbsim3:3.0.5--86541aa3eccd4c3c'

    input:
    tuple val(meta), path(fasta)
    path model

    output:
    tuple val(meta), path("${prefix}.fastq.gz")   , emit: reads
    tuple val(meta), path("${prefix}.maf.gz")     , emit: maf
    tuple val(meta), path("${prefix}.contigs.tsv"), emit: contigs
    path "versions.yml"                           , emit: versions

    script:
    def args    = task.ext.args ?: ''
    def VERSION = '3.0.5' // PBSIM3 has no --version flag; keep in sync with the conda pin
    prefix      = task.ext.prefix ?: "${meta.id}_ont"
    """
    # Read IDs become <sample>|S<contig index>_<read number>
    pbsim \\
        --strategy wgs \\
        --method errhmm \\
        --errhmm $model \\
        --genome $fasta \\
        --depth ${params.ont_depth} \\
        --seed ${params.seed} \\
        --id-prefix '${meta.id}|S' \\
        --prefix sim \\
        $args

    # PBSIM writes one set of outputs per contig; gzip members concatenate cleanly
    ls sim_*.fq.gz  | sort -V | xargs cat > ${prefix}.fastq.gz
    ls sim_*.maf.gz | sort -V | xargs cat > ${prefix}.maf.gz

    # Map the contig index in each read ID back to the contig name
    for ref in \$(ls sim_*.ref | sort -V); do
        idx=\${ref#sim_}
        idx=\$((10#\${idx%.ref}))
        printf '%s\\t%s\\n' "\$idx" "\$(head -n1 \$ref | sed 's/^>//; s/[[:space:]].*//')"
    done > ${prefix}.contigs.tsv

    rm sim_*

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        pbsim3: $VERSION
    END_VERSIONS
    """
}