![](assets/omixdata.png)
## Tutorial: Análise de expressão gênica diferencial com RNA-Seq

## Requisitos

- Ubuntu Linux (>=16.04)
- R (>=3.6)
- Python (>=3.5)

## Programas e bibliotecas instaladas com o `make install`

- SRA-Toolkit: conjunto de ferramentas para baixar dados de sequenciamento disponíveis no NCBI SRA.
- xml2-lib: biblioteca para processar arquivos XML (dependência de algumas bibliotecas do R para análise diferencial).
- STAR: ferramenta de alinhamento de leituras para RNA-Seq.
- Samtools: ferramenta para processar dados de alinhamento de leituras de sequeciamento.
- pip3: gerenciador de pacotes do Python 3.
- Pandas (python): biblioteca do Python para processar dados de tabelas.
- HTSeq: ferramenta para contagem de leituras alinhadas em cada gene.
- Limma, DESeq, DESeq2, edgeR, HTSFilter (R): stack de bibliotecas para análise de expressão diferencial.

## Executando

```
# instalar dependências
make install

# baixar dados do SRA
make download

# indexar referência
make index_reference

# mapear leituras contra a referência
make map_reads

# contar reads mapeadas em cada gene
make count_reads

# executar análise de expressão diferencial
make differential_expression_analysis
```
