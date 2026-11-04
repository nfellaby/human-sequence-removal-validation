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
Completed at: 03-Nov-2026 19:21:30
Duration    : 2h 41m 9s
CPU hours   : 265.9
Succeeded   : 108
```