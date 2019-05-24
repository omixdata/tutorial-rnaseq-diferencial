while read sample; do
	mkdir -p alignments/$sample
	STAR \
		--runThreadN 4 \
     		--genomeDir reference_indexed \
		--readFilesIn reads/$sample.fastq \
		--outFileNamePrefix alignments/$sample/out

done < samples
