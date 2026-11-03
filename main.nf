#!/usr/bin/env nextflow
/*
 * synth-reads: simulate Illumina (DWGSIM) and ONT (PBSIM3) reads from assemblies
 * listed in a samplesheet (sample,fasta[,md5]).
 */
nextflow.enable.dsl = 2

include { CHECK_MD5         } from './modules/local/check_md5'
include { PREPARE_REFERENCE } from './modules/local/prepare_reference'
include { DWGSIM            } from './modules/local/dwgsim'
include { PBSIM             } from './modules/local/pbsim'

workflow {

    if (!params.input) {
        error "Please provide a samplesheet with --input"
    }

    def platforms = params.platforms.tokenize(',')*.trim()*.toLowerCase()
    def unknown   = platforms - ['illumina', 'ont']
    if (unknown) {
        error "Unknown platform(s) in --platforms: ${unknown.join(', ')}. Use illumina and/or ont."
    }

    ch_versions = Channel.empty()

    //
    // Parse samplesheet
    //
    ch_assemblies = Channel
        .fromPath(params.input, checkIfExists: true)
        .splitCsv(header: true, strip: true)
        .map { row ->
            if (!row.sample || !row.fasta) {
                error "Each samplesheet row needs 'sample' and 'fasta' values: ${row}"
            }
            def meta = [ id: row.sample ]
            def md5  = row.md5 ? file(row.md5, checkIfExists: true) : []
            [ meta, file(row.fasta, checkIfExists: true), md5 ]
        }
        .branch { meta, fasta, md5 ->
            with_md5:    md5
            without_md5: true
        }

    //
    // Verify downloads where an MD5 is given
    //
    CHECK_MD5 ( ch_assemblies.with_md5 )
    ch_versions = ch_versions.mix(CHECK_MD5.out.versions.first())

    ch_fasta = CHECK_MD5.out.fasta
        .mix( ch_assemblies.without_md5.map { meta, fasta, md5 -> [ meta, fasta ] } )

    //
    // Decompress, uppercase and drop short contigs
    //
    PREPARE_REFERENCE ( ch_fasta )
    ch_versions = ch_versions.mix(PREPARE_REFERENCE.out.versions.first())

    ch_samplesheet_rows = Channel.empty()
    def outdir = file(params.outdir).toString()

    //
    // Illumina paired-end reads
    //
    if ('illumina' in platforms) {
        DWGSIM ( PREPARE_REFERENCE.out.fasta )
        ch_versions = ch_versions.mix(DWGSIM.out.versions.first())

        ch_samplesheet_rows = ch_samplesheet_rows.mix(
            DWGSIM.out.reads.map { meta, reads ->
                def (r1, r2) = reads.sort { it.name }
                "${meta.id},illumina,${outdir}/illumina/${r1.name},${outdir}/illumina/${r2.name}"
            }
        )
    }

    //
    // ONT long reads
    //
    if ('ont' in platforms) {
        PBSIM (
            PREPARE_REFERENCE.out.fasta,
            file(params.pbsim_model, checkIfExists: true)
        )
        ch_versions = ch_versions.mix(PBSIM.out.versions.first())

        ch_samplesheet_rows = ch_samplesheet_rows.mix(
            PBSIM.out.reads.map { meta, reads ->
                "${meta.id},ont,${outdir}/ont/${reads.name},"
            }
        )
    }

    //
    // Samplesheet of simulated reads, ready to feed into a downstream pipeline
    //
    ch_samplesheet_rows.collectFile(
        name:     'simulated_samplesheet.csv',
        seed:     'sample,platform,fastq_1,fastq_2',
        newLine:  true,
        sort:     true,
        storeDir: params.outdir
    )

    ch_versions
        .collectFile(name: 'software_versions.yml', storeDir: "${params.outdir}/pipeline_info")
}
