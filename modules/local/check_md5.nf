process CHECK_MD5 {
    tag "$meta.id"

    conda 'conda-forge::coreutils=9.12'

    input:
    tuple val(meta), path(fasta), path(md5)

    output:
    tuple val(meta), path(fasta), emit: fasta
    path "versions.yml"         , emit: versions

    script:
    """
    expected=\$(awk 'NR == 1 { print \$1 }' $md5)
    observed=\$(md5sum $fasta | awk '{ print \$1 }')

    if [[ "\$expected" != "\$observed" ]]; then
        echo "MD5 mismatch for ${meta.id} ($fasta): expected \$expected, got \$observed" >&2
        exit 1
    fi

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        coreutils: \$(md5sum --version | head -n1 | awk '{ print \$NF }')
    END_VERSIONS
    """
}