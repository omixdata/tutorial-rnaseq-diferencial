mkdir -p reads/
cd reads/

while read sample; do
	fastq-dump $sample
done < ../samples
