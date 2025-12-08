#' Run differential expression analysis using edgeR
#'
#' @param dge DGEList object created by create_dgelist()
#' @param fdr_cutoff FDR threshold for filtering DEGs
#' @param logfc_cutoff Absolute log2 fold-change threshold
#'
#' @return Data frame of differentially expressed genes
#' @export
run_deg <- function(dge, fdr_cutoff = 0.05, logfc_cutoff = 1) {
  library(edgeR)
  
  design <- model.matrix(~ dge$samples$group)
  dge <- estimateDisp(dge, design)
  fit <- glmFit(dge, design)
  lrt <- glmLRT(fit, coef = 2)
  
  tt <- topTags(lrt, n = Inf)$table
  
  deg <- tt[tt$FDR < fdr_cutoff & abs(tt$logFC) > logfc_cutoff, ]
  return(deg)
}
