cd alignments
while read sample; do
	cd $sample
	samtools view -Sb -F4 outAligned.out.sam > unsorted.bam
	samtools sort unsorted.bam sorted
	samtools index sorted.bam
	cd ..
done < ../samples
