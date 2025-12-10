# load_counts.R

load_counts <- function(count_file) {
  # Reads a count matrix file (CSV or TSV)
  message("Loading count matrix from: ", count_file)
  
  counts <- read.csv(count_file, row.names = 1, check.names = FALSE)
  
  # Convert to matrix
  counts <- as.matrix(counts)
  
  return(counts)
}

