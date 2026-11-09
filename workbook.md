# human-sequence-removal-validation
A workbook for validation of human sequence data removal.

## Sourcing Human Genomes
- [Human Pangenome Reference Consortium](https://humanpangenome.org/)
   - 466 GenBank Accessions
   - 234 Sample ids (many have multiple GenBank Accessions)
   - Demographics:
      - 27 Unique demographics (18 countries x 23 ethnicities)

| Country | Ethnicity | Count |
|---|---|--:|
| USA | African | 2 |
| USA | African | 12 |
| Barbados | African | 24 |
| Bangladesh | Bengali | 20 |
| UK | British | 20 |
| China | Chinese Dai | 10 |
| Colombia | Colombian | 22 |
| Nigeria | Esan | 20 |
| Finland | Finnish | 18 |
| The Gambia | Western Division – Mandinka | 34 |
| USA | Indian | 16 |
| China | Han | 10 |
| China | Han | 22 |
| Spain | Iberian | 6 |
| UK | Indian | 6 |
| Japan | Japanese | 32 |
| Vietnam | Kinh | 26 |
| Kenya | Luhya | 12 |
| Kenya | Maasai | 2 |
| Sierra Leone | Mende | 18 |
| USA | Mexican | 4 |
| Unknown | Unknown | 6 |
| Peru | Peruvian | 30 |
| Puerto Rico | Puerto Rican | 32 |
| Pakistan | Punjabi | 20 |
| UK | Sri Lankan | 10 |
| Italy | Toscani | 16 |
| Nigeria | Yoruba | 16 |


- [NCBI](https://www.ncbi.nlm.nih.gov/datasets/taxonomy/9606/)
   - 2,589 datasets
      - 1 reference genome ([GRCh38.p14](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/))
      - 2 complete genomes:
          - [HuRef2.0](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_059792245.1/)
          - [T2T-CHM13v2.0](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_009914755.1/) - RefSeq

I was unable to identify other sources of human genomes outside of these easily.

## Downloading Human Sequence Data
- Downloading one of each 27 Unique demographics
   - Selected based on recency and size of genome

| Original Description | Country | Ethnicity | Count of Accessions | Sample ID | Filename | GenBank Accession |
|---|---|---|--:|---|---|---|
| Gambian in Western Division – Mandinka | The Gambia | Western Division – Mandinka | 34 | HG02583 | HG02583_hap1_hprc_r2_v1.0.1.fa.gz | GCA_042076985.1 |
| Japanese in Tokyo, Japan | Japan | Japanese | 32 | NA18959 | NA18959_hap2_hprc_r2_v1.0.1.fa.gz | GCA_046332235.1 |
| Puerto Rican in Puerto Rico | Puerto Rico | Puerto Rican | 32 | HG00741 | HG00741_mat_hprc_r2_v1.0.1.fa.gz | GCA_018471095.2 |
| Peruvian in Lima, Peru | Peru | Peruvian | 30 | HG01943 | HG01943_mat_hprc_r2_v1.0.1.fa.gz | GCA_042076535.1 |
| Kinh in Ho Chi Minh City, Vietnam | Vietnam | Kinh | 26 | HG02015 | HG02015_mat_hprc_r2_v1.0.1.fa.gz | GCA_041900105.1 |
| African Caribbean in Barbados | Barbados | African | 24 | HG01884 | HG01884_mat_hprc_r2_v1.0.1.fa.gz | GCA_042027665.1 |
| Colombian in Medellin, Colombia | Colombia | Colombian | 22 | HG01496 | HG01496_pat_hprc_r2_v1.0.1.fa.gz | GCA_042027595.1 |
| Han Chinese South, China | China | Han | 22 | HG00597 | HG00597_mat_hprc_r2_v1.0.1.fa.gz | GCA_041900265.1 |
| Bengali in Bangladesh | Bangladesh | Bengali | 20 | HG03804 | HG03804_mat_hprc_r2_v1.0.1.fa.gz | GCA_042036285.1 |
| British from England and Scotland | UK | British | 20 | HG00146 | HG00146_hap2_hprc_r2_v1.0.1.fa.gz | GCA_042078085.1 |
| Esan in Nigeria | Nigeria | Esan | 20 | HG03521 | HG03521_hap2_hprc_r2_v1.0.1.fa.gz | GCA_044166645.1 |
| Punjabi in Lahore, Pakistan | Pakistan | Punjabi | 20 | HG02738 | HG02738_mat_hprc_r2_v1.0.1.fa.gz | GCA_046056425.1 |
| Finnish in Finland | Finland | Finnish | 18 | HG00344 | HG00344_hap1_hprc_r2_v1.0.1.fa.gz | GCA_044166765.1 |
| Mende in Sierra Leone | Sierra Leone | Mende | 18 | HG03098 | HG03098_mat_hprc_r2_v1.0.1.fa.gz | GCA_018506165.2 |
| Gujarati Indians in Houston, Texas, USA | USA | Indian | 16 | NA21102 | NA21102_hap1_hprc_r2_v1.0.1.fa.gz | GCA_044166315.1 |
| Toscani in Italia | Italy | Toscani | 16 | NA20799 | NA20799_hap1_hprc_r2_v1.0.1.fa.gz | GCA_045523085.1 |
| Yoruba in Ibadan, Nigeria | Nigeria | Yoruba | 16 | NA19159 | NA19159_hap1_hprc_r2_v1.0.1.fa.gz | GCA_046056445.1 |
| African Ancestry in Southwest USA | USA | African | 12 | NA20346 | NA20346_hap2_hprc_r2_v1.0.1.fa.gz | GCA_044166135.1 |
| Luhya in Webuye, Kenya | Kenya | Luhya | 12 | NA19468 | NA19468_hap2_hprc_r2_v1.0.1.fa.gz | GCA_042035175.1 |
| Chinese Dai in Xishuangbanna | China | Chinese Dai | 10 | HG02391 | HG02391_hap2_hprc_r2_v1.0.1.fa.gz | GCA_042034155.1 |
| Han Chinese in Beijing, China | China | Han | 10 | NA18620 | NA18620_hap2_hprc_r2_v1.0.1.fa.gz | GCA_042077305.1 |
| Sri Lankan Tamil in the UK | UK | Sri Lankan | 10 | HG04115 | HG04115_mat_hprc_r2_v1.0.1.fa.gz | GCA_042028945.1 |
| Iberian Populations in Spain | Spain | Iberian | 6 | HG01784 | HG01784_hap1_hprc_r2_v1.0.1.fa.gz | GCA_042034305.1 |
| Indian Telugu in the UK | UK | Indian | 6 | HG03742 | HG03742_hap2_hprc_r2_v1.0.1.fa.gz | GCA_042034195.1 |
| Mexican Ancestry in Los Angeles, California, USA | USA | Mexican | 4 | NA19682 | NA19682_hap1_hprc_r2_v1.0.1.fa.gz | GCA_044165125.1 |
| African Americans living in St. Louis, Missouri | USA | African | 2 | HG06807 | HG06807_mat_v1.0.genbank.fa.gz | GCA_046332005.1 |
| Maasai in Kinyawa, Kenya | Kenya | Maasai | 2 | NA21309 | NA21309_mat_hprc_r2_v1.0.1.fa.gz | GCA_018504655.2 |
| N/A | Unknown | Unknown | 6 | | | |

- Download each to HPC:
    - S3 URI is in the samplesheet
```
# Download fa.gz
tail -n +2 ../samplesheet.tsv | \
   tr -d '\r' | \
   cut -f8,9 | \
   while IFS=$'\t' read -r fa md5; do   [[ -z "$fa" ]] && continue;   \
   aws s3 cp --no-sign-request "$fa" assemblies/;   \
   aws s3 cp --no-sign-request "$md5" assemblies/; \
done

# Check files against its MD5:
cd assemblies
for m in *.md5; do \
  f=${m%.md5} \
  [[ "$(cut -d' ' -f1 "$m")" == "$(md5sum "$f" | cut -d' ' -f1)" ]] && \
  echo "OK   $f" || echo "FAIL $f" \
done \
```

## Synthesising Reads
Generate synthetic reads for each human assembly

### Long single read, ONT
```
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
```

### Short Paired read, illumina
```
dwgsim \\
   $args \\
   -N ${params.illumina_read_pairs} \\
   -z ${params.seed} \\
   $fasta \\
   $prefix
```

- Running nextflow
```bash
nextflow run -w scratch/ -latest -r feat/synthetise-reads nfellaby/human-sequence-removal-validation -profile slurm,apptainer --input nf_samplesheet.tsv --outdir results -resume 
```

- Run stats:
```bash
Nextflow 26.10.5 is available - Please consider updating your version to it

 N E X T F L O W   ~  version 26.10.4

Launching `https://github.com/nfellaby/human-sequence-removal-validation` [distraught_tesla] revision: e93c5fc3da [main]

executor >  slurm (112)
[2f/511efd] process > CHECK_MD5 (HG02391)                     [100%] 28 of 28 ✔
[7c/0cc7fe] process > SYNTH_READS:PREPARE_REFERENCE (HG03098) [100%] 28 of 28 ✔
[95/0a0b4c] process > SYNTH_READS:DWGSIM (HG03098)            [100%] 28 of 28 ✔
[8f/0fae19] process > SYNTH_READS:PBSIM (NA18959)             [100%] 28 of 28 ✔
Waiting for file transfers to complete (2 files)
Completed at: 06-Nov-2026 12:49:47
Duration    : 2h 42m 15s
CPU hours   : 285.7
Succeeded   : 112
```

## Read Removal with Deacon
### Default Settings
- Running Read removal with Deacon using default parameters and the standard pangenome reference, used the [nf-deacon](https://github.com/nfellaby/nf-deacon) repo:
```bash
Nextflow 26.10.5 is available - Please consider updating your version to it

 N E X T F L O W   ~  version 26.10.4

Launching `https://github.com/nfellaby/nf-deacon` [golden_archimedes] revision: b7da0ef055 [main]

executor >  slurm (57)
[skipped  ] process > DEPLETE_READS:DEACON_INDEX_FETCH (panhuman-1)  [100%] 1 of 1, stored: 1 ✔
[40/155ea9] process > DEPLETE_READS:DEACON_FILTER (HG06807_illumina) [100%] 56 of 56 ✔
[bf/14994e] process > DEPLETE_READS:SUMMARISE_DEPLETION (1)          [100%] 1 of 1 ✔
Completed at: 06-Nov-2026 13:44:22
Duration    : 6m 31s
CPU hours   : 10.5
Succeeded   : 57
```

#### Results

- ILLUMINA
   - 99.997% reads removed across 28 samples
   - 3,010 of 112,000,000 reads retained · lowest sample 99.994%
- ONT
   - 99.390% reads removed across 28 samples
   - 1,048,516 of 171,802,652 reads retained · lowest sample 94.748%
      - The sample with 95% read removal was associated with GRCh38.p14 (347,612 reads retained)

### Refined Index
- Running with an index created from the 28 assembled genomes:
```bash
cat reference_data/assemblies/*.fa.gz \
   >>reference_data/combined_human_genome_assemblies.fa.gz
deacon index build reference_data/combined_human_genome_assemblies.fa.gz \ 
   >reference_data/indexes/combined_human_genome_assemblies.idx
```
- Re-run Deacon:
```bash
nextflow run -w work/ -r main nfellaby/nf-deacon -profile slurm,apptainer --input 20261104_synth-reads/simulated_samplesheet.csv --deacon_index reference_data/indexes/combined_human_genome_assemblies.idx --outdir 20261104_deacon-depletion_refined-index
letion_refined-index -resume
```

#### Results
- ILLUMINA
   - 99.999% reads removed across 28 samples
   - 1,048 of 112,000,000 reads retained · lowest sample 99.997%
- ONT
   - 99.385% reads removed across 28 samples
   - 1,056,645 of 171,802,652 reads retained · lowest sample 94.744%
      - The sample with 95% read removal was associated with GRCh38.p14 (347,612 reads retained)

## Mapping Reads against References
- Generate samplesheet
```bash
DEACON_DIR=20261104_deacon-depletion_refined-index/deacon
REF_DIR=reference_data/assemblies        # where the HPRC .fa.gz files (and GRCh38) live

{
  echo "sample,platform,fastq_1,fastq_2,reference"
  for json in "$DEACON_DIR"/*/*.deacon.json; do
    base=$(basename "$json" .deacon.json)       # e.g. HG00146_illumina
    platform=${base##*_}                        # illumina | ont
    sample=${base%_*}                           # HG00146, GRCh38.p14
    dir=$(dirname "$json")

    if [[ $platform == illumina ]]; then
      fq1=$(readlink -f "$dir/${base}.deacon_R1.fastq.gz")
      fq2=$(readlink -f "$dir/${base}.deacon_R2.fastq.gz")
    else
      fq1=$(readlink -f "$dir/${base}.deacon.fastq.gz")
      fq2=""
    fi

    refs=( "$REF_DIR/${sample}"*.f*.gz )
    if [[ ${#refs[@]} -ne 1 || ! -e ${refs[0]} ]]; then
      echo "WARN: expected one reference for $sample, found: ${refs[*]}" >&2
      continue
    fi

    printf '%s,%s,%s,%s,%s\n' "$sample" "$platform" "$fq1" "$fq2" "$(readlink -f "${refs[0]}")"
  done
} > map_samplesheet.csv
```

- Run reference mapping:
```bash
nextflow run -latest -w work/ -r dev nfellaby/nf-read-ref-mapping -profile slurm,apptainer --input map_samplesheet.csv --outdir 20261104_deacon-depletion_refined-index_mapped -resume
```

- Run Time:
```bash
Pulling nfellaby/nf-read-ref-mapping:dev ...
 Already-up-to-date
Launching `https://github.com/nfellaby/nf-read-ref-mapping` [big_kalam] revision: 350d2d162c [dev]

executor >  slurm (113)
[2d/922d23] process > MAP_READS:MINIMAP2_INDEX (NA20346_hap2_hprc_r2_v1.0.1 (map-ont)) [100%] 56 of 56, cached: 56 ✔
[0e/31cbfe] process > MAP_READS:MINIMAP2_ALIGN (NA18620_illumina)                      [100%] 56 of 56 ✔
[d2/636d41] process > MAP_READS:BAM_STATS (HG02738_ont)                                [100%] 56 of 56 ✔
[ba/b36134] process > MAP_READS:SUMMARISE_MAPPING (1)                                  [100%] 1 of 1 ✔                                                                                          Completed at: 06-Nov-2026 21:37:32                                                                                                                                                              Duration    : 13m 16s
CPU hours   : 13.9 (68.5% cached)
Succeeded   : 113
Cached      : 56
```
