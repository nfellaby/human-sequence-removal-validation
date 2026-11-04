#!/usr/bin/env nextflow
/*
 * synth-reads: simulate Illumina (DWGSIM) and ONT (PBSIM3) reads from assemblies
 * listed in a samplesheet (sample,fasta[,md5]).
 */
nextflow.enable.dsl = 2
include { SYNTH_READS      } from './subworkflows/synthesise_reads'
include { CHECK_MD5         } from './modules/local/check_md5'


workflow {

    if (!params.input) {
        error "Please provide a samplesheet with --input"
    }

    def platforms = params.platforms.tokenize(',')*.trim()*.toLowerCase()
    def unknown   = platforms - ['illumina', 'ont']
    if (unknown) {
        error "Unknown platform(s) in --platforms: ${unknown.join(', ')}. Use illumina and/or ont."
    }

    def input_ext = params.input.tokenize('.').last().toLowerCase()
    if (!(input_ext in ['csv', 'tsv'])) {
        error "Samplesheet must be .csv or .tsv: ${params.input}"
    }
    def sep = input_ext == 'tsv' ? '\t' : ','

    //
    // Parse samplesheet
    //
    ch_assemblies = Channel
        .fromPath(params.input, checkIfExists: true)
        .splitCsv(header: true, strip: true, sep: sep)
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

    ch_versions = Channel.empty()

    //
    // Verify downloads where an MD5 is given
    //
    CHECK_MD5 ( ch_assemblies.with_md5 )
    ch_versions = ch_versions.mix(CHECK_MD5.out.versions.first())

    ch_fasta = CHECK_MD5.out.fasta
        .mix( ch_assemblies.without_md5.map { meta, fasta, md5 -> [ meta, fasta ] } )


    // Synthesise Reads
    SYNTH_READS(ch_fasta, platforms)

    ch_versions
        .mix(SYNTH_READS.out.versions)
        .collectFile(name: 'software_versions.yml', storeDir: "${params.outdir}/pipeline_info")


}
