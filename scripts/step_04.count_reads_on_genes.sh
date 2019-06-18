FEATURE_TYPE=CDS
GENE_KEY=locus_tag
cd read_count
while read sample; do
	htseq-count \
		-t $FEATURE_TYPE \
		-i $GENE_KEY \
		-f bam \
		../alignments/$sample/sorted.bam \
		../reference/reference.gff3 \
		> $sample.raw.count
	cat $sample.raw.count > $sample.count
	rm $sample.raw.count
done < ../samples
