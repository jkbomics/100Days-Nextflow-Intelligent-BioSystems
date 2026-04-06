library(clusterProfiler)
library(org.Hs.eg.db)

genes <- read.table("gene_list.txt", stringsAsFactors=FALSE)[,1]

gene_ids <- bitr(genes,
                 fromType="SYMBOL",
                 toType="ENTREZID",
                 OrgDb="org.Hs.eg.db")

kegg <- enrichKEGG(gene = gene_ids$ENTREZID,
                   organism = "hsa")

go <- enrichGO(gene = gene_ids$ENTREZID,
               OrgDb = org.Hs.eg.db,
               ont = "BP")

write.table(as.data.frame(kegg), "kegg_results.tsv", sep="\t", quote=FALSE)
write.table(as.data.frame(go), "go_results.tsv", sep="\t", quote=FALSE)