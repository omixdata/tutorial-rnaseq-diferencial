cd read_count
while read sample; do
	htseq-count \
		-t gene \
		-i locus_tag \
		-f bam \
		../alignments/$sample/sorted.bam \
		../reference/reference.gff3 \
		> $sample.raw.count
	cat $sample.raw.count | grep LIC_ > $sample.count
	rm $sample.raw.count
done < ../samples
