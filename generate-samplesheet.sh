module load Java

java -jar -Xmx12g -XX:ParallelGCThreads=8 -Djava.io.tmpdir=${TMPDIR} /groups/umcg-wijmenga/tmp04/umcg-hbrugge/apps/bam-per-cell-1.0.jar \
   --samplesheet \
   -i /groups/umcg-wijmenga/tmp04/umcg-mdam/bamFile6kcells10XGenomics/pbmc6k_possorted_genome_bam.bam \
   -b /groups/umcg-wijmenga/tmp04/umcg-mdam/bamFile6kcells10XGenomics/barcodes.tsv


