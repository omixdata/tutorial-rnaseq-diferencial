
#!/usr/bin/env Rscript

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("DESeq","DESeq2","edgeR", "HTSFilter", "limma"),  dependencies=TRUE)
