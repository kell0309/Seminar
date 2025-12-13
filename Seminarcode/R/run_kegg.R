run_kegg_enrichment <- function(deg_results) 
  {
  library(clusterProfiler)
  library(org.Hs.eg.db)
  
  # Extract SYMBOLs from deg_results
  gene_symbols <- rownames(deg_results)
  
  # Convert SYMBOL -> EntrezID
  gene_df <- bitr(
    gene_symbols,
    fromType = "SYMBOL",
    toType   = "ENTREZID",
    OrgDb    = org.Hs.eg.db
  )
  
  entrez_ids <- unique(gene_df$ENTREZID)
  entrez_ids <- na.omit(entrez_ids)
  
  # Run KEGG ORA
  kegg_res <- enrichKEGG(
    gene         = entrez_ids,
    organism     = "hsa",
    pvalueCutoff = 0.05
  )
  
  return(kegg_res)
}
