library(DESeq2)

counts <- read.table("expression_matrix.tsv", header=TRUE, row.names=1, sep="\t")
coldata <- read.table("design_matrix.tsv", header=FALSE, row.names=1, sep="\t")

colnames(coldata) <- c("condition")

dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = coldata,
  design = ~ condition
)

dds <- DESeq(dds)

res <- results(dds)

write.table(as.data.frame(res),
            file="deseq2_results.tsv",
            sep="\t",
            quote=FALSE)

png("volcano_plot.png")

plot(res$log2FoldChange,
     -log10(res$pvalue),
     pch=20,
     main="Volcano Plot",
     xlab="Log2 Fold Change",
     ylab="-log10(p-value)")

dev.off()