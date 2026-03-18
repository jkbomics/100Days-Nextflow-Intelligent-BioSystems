library(clusterProfiler)
library(org.Hs.eg.db)

# Load DESeq2 results
res <- read.table("deseq2_results.tsv", header=TRUE, sep="\t")

# Filter significant genes
sig_genes <- rownames(res[res$pvalue < 0.05, ])

# Convert to Entrez IDs
gene_ids <- bitr(sig_genes,
                 fromType="SYMBOL",
                 toType="ENTREZID",
                 OrgDb="org.Hs.eg.db")

# KEGG enrichment
kegg <- enrichKEGG(gene = gene_ids$ENTREZID,
                   organism = "hsa")

# GO enrichment
go <- enrichGO(gene = gene_ids$ENTREZID,
               OrgDb = org.Hs.eg.db,
               ont = "BP")

# Save results
write.table(as.data.frame(kegg), "kegg_enrichment.tsv", sep="\t", quote=FALSE)
write.table(as.data.frame(go), "go_enrichment.tsv", sep="\t", quote=FALSE)

# Plot KEGG
png("kegg_dotplot.png")
dotplot(kegg)
dev.off()

# Plot GO
png("go_dotplot.png")
dotplot(go)
dev.off()