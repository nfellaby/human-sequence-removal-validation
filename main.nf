#!/usr/bin/env nextflow
/*
 * synth-reads: simulate Illumina (DWGSIM) and ONT (PBSIM3) reads from assemblies
 * listed in a samplesheet (sample,fasta[,md5]).
 */
nextflow.enable.dsl = 2
include { SYNTH_READS      } from './subworkflows/synthesise_reads'


workflow {

    if (!params.input) {
        error "Please provide a samplesheet with --input"
    }

    def platforms = params.platforms.tokenize(',')*.trim()*.toLowerCase()
    def unknown   = platforms - ['illumina', 'ont']
    if (unknown) {
        error "Unknown platform(s) in --platforms: ${unknown.join(', ')}. Use illumina and/or ont."
    }

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


    // Synthesise Reads
    SYNTH_READS(ch_assemblies)


}
