# filter_low_counts.R

library(edgeR)

filter_low_counts <- function(dge, min_count = 10) {
  message("Filtering low count genes...")

  # Keep genes that have at least min_count in at least 2 samples
  keep <- rowSums(dge$counts >= min_count) >= 2
  
  filtered_dge <- dge[keep, , keep.lib.sizes = FALSE]

  message(sum(keep), " genes retained out of ", length(keep))
  
  return(filtered_dge)
}

