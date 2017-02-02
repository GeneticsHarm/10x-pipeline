#!/usr/bin/env bash

module load Molgenis-Compute
module load Java

#Generate samplesheet
java -jar /groups/umcg-wijmenga/tmp04/umcg-hbrugge/apps/bam-per-cell-1.0.jar \
   --samplesheet \
   -i /groups/umcg-wijmenga/tmp04/umcg-mdam/bamFile6kcells10XGenomics/pbmc6k_possorted_genome_bam.bam \
   -b /groups/umcg-wijmenga/tmp04/umcg-mdam/bamFile6kcells10XGenomics/barcodes.tsv

#Generate jobs
sh $EBROOTMOLGENISMINCOMPUTE/molgenis_compute.sh \
--backend slurm \
--generate \
--header header.ftl \
-p parameters.converted.csv \
-p samplesheet.csv \
-w ./workflow-no-split.csv \
-rundir jobs/ \
--weave

