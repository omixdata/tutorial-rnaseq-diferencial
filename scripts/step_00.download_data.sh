mkdir -p reads/
cd reads/

while read line; do

	fastq-dump $line

done < ../samples
