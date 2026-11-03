# human-sequence-removal-validation
A Nextflow Pipeline for Generating Synthetic Reads from human sequences

Simulates Illumina paired-end reads (DWGSIM) and ONT reads (PBSIM3) from each assembly in a samplesheet.
 
## Samplesheet (Input)
 
CSV with columns `sample,fasta,md5`. `fasta` can be a local path, `s3://` or `https://` URL, gzipped or not.
`md5` is optional; when given, the download is checked before simulation.
 
Convert the HPRC TSV (columns 6, 8 and 9 = Filename, AWS FASTA, FASTA MD5):

## Run
 
```bash
nextflow run . -profile conda --input samplesheet.csv --outdir results
```
 
| Parameter | Default | |
|---|---|---|
| `--platforms` | `illumina,ont` | Either or both |
| `--illumina_read_pairs` | `2000000` | Pairs per assembly |
| `--ont_depth` | `0.5` | Depth per assembly |
| `--pbsim_model` | `ERRHMM-ONT-HQ.model` (GitHub) | Local path or URL |
| `--min_contig_length` | `10000` | Shorter contigs are dropped |
| `--seed` | `42` | Used by both simulators |
| `--aws_anonymous` | `true` | Unsigned S3 access for public buckets |
 
Read length, insert size, error rates and accuracy are set through `ext.args` in `conf/modules.config`.

## Outputs
 
- `illumina/<sample>_illumina_R{1,2}.fastq.gz` and the DWGSIM mutations VCF
- `ont/<sample>_ont.fastq.gz`, `.maf.gz` (alignment truth) and `.contigs.tsv`
- `simulated_samplesheet.csv`: `sample,platform,fastq_1,fastq_2` with absolute paths
- `pipeline_info/software_versions.yml`
Read names are prefixed with `<sample>|`. Illumina names then carry the DWGSIM truth
(`contig_pos1_pos2_...`). ONT names are `<sample>|S<contig index>_<n>`; `contigs.tsv` maps the index to the contig name.