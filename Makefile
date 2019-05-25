download_data:
	bash scripts/step_00.download_data.sh

index_reference:
	bash scripts/step_01.index_reference.sh

map_reads:
	bash scripts/step_02.map_reads.sh
	bash scripts/step_03.index_sort_read.sh

count_reads:
	bash scripts/step_04.count_reads_on_genes.sh

differential_expression_analysis:
	mkdir -p differential_expression; \
	cd differential_expression; \
	Rscript ../scripts/step_06.differential_expression.R
