#' Create a DGEList object for edgeR analysis
#'
#' @param counts Filtered count matrix
#' @param group A vector of sample groups (e.g. "carcinoma", "normal")
#'
#' @return DGEList object
#' @export
create_dgelist <- function(counts, group) {
  library(edgeR)
  dge <- DGEList(counts = counts, group = group)
  dge <- calcNormFactors(dge)
  return(dge)
}
