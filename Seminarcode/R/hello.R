# Hello, world!
#
# This is an example function named 'hello' 
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}
getwd()

#Show which files are in this folder
list.files()

counts_test <- read.delim("E-MTAB-2523.counts.txt", header = TRUE, row.names = 1, fill = TRUE)
head(counts_test[, 1:5])


counts <- read.table("E-MTAB-2523.counts.txt",
                     header = TRUE,
                     row.names = NULL,
                     check.names = FALSE,
                     fill = TRUE)
colnames(counts)[1] <- "gene"
dim(counts)
head(counts[, 1:5])
colnames(counts)
ncol(counts)
tail(counts)
colnames(counts)
ncol(counts)
samples <- read.table("E-MTAB-2523_sample table.txt",
                      header = TRUE,
                      sep = "\t")

samples

all(samples$sample == colnames(counts)[-1])
sapply(counts, class)

# the first column is "gene", do not convert that
for (i in 2:ncol(counts)) {
  counts[[i]] <- as.numeric(counts[[i]])
}
counts_matrix <- as.matrix(counts[, -1])
is.numeric(counts_matrix)
counts_matrix <- counts_matrix[complete.cases(counts_matrix), ]
dim(counts_matrix)
keep <- rowSums(counts_matrix) > 10
filtered_counts <- counts_matrix[keep, ]
dim(filtered_counts)
sapply(counts, class)
