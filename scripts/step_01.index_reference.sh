mkdir -p reference_indexed
STAR \
     --runMode genomeGenerate \
     --genomeFastaFiles reference/reference.fasta \
     --genomeDir reference_indexed
