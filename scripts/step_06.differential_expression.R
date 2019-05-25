#!/usr/bin/env Rscript

#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install(c("DESeq","DESeq2","edgeR", "HTSFilter", "limma"),  dependencies=TRUE)
#

library(edgeR)
library(limma)
library(RColorBrewer)
library(mixOmics)
library(HTSFilter)

rawCountTable <- read.table('../read_count/merged.csv', header=TRUE, row.names=1, sep=',')
sampleInfo <- read.table("../samples_groups", header=TRUE, row.names=1, sep=',')

dgeFull <- DGEList(rawCountTable, group=sampleInfo$group)
dgeFull$sampleInfo <- sampleInfo

pseudoCounts <- log2(dgeFull$counts+1)

boxplot(pseudoCounts, col="gray")

dge <- calcNormFactors(dgeFull)
dge <- estimateCommonDisp(dge)
dge <- estimateTagwiseDisp(dge)

dgeTest <- exactTest(dge)
filtData <- HTSFilter(dge)$filteredData
dgeTestFilt <- exactTest(filtData)
hist(dgeTest$table[,"PValue"], breaks=50)
hist(dgeTestFilt$table[,"PValue"], breaks=50)

resFilt <- topTags(dgeTestFilt, n=nrow(dgeTest$table))

sigDownReg <- resFilt$table[resFilt$table$FDR<0.05,]
sigDownReg <- sigDownReg[order(sigDownReg$logFC),]
sigUpReg <- sigDownReg[order(sigDownReg$logFC, decreasing=TRUE),]

write.csv(sigDownReg, file="sigDownReg.csv")
write.csv(sigUpReg, file="sigUpReg.csv")

plotSmear(dgeTestFilt,
          de.tags = rownames(resFilt$table)[which(resFilt$table$FDR<0.01)])

volcanoData <- cbind(resFilt$table$logFC, -log10(resFilt$table$FDR))
colnames(volcanoData) <- c("logFC", "negLogPval")

plot(volcanoData, pch=19)