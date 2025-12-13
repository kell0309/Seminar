# load up libraries
library(clusterProfiler)
library(org.Hs.eg.db)

run_go_enrichment <- function(deg_results)
{
  #use the row names of deg_results as gene symbols
  gene_symbols <- rownames(deg_results)
  
  #run the GO ORA
  go_res <- enrichGO(
    gene =gene_symbols,
    OrgDb = org.Hs.eg.db,
    keyType = "SYMBOL",
    pvalueCutoff = 0.05,
    qvalueCutoff = 0.05,
  )
  
  return(go_res)
}