#' Histograms of raw p-values
#'
#' Histogram of raw p-values for each comparison
#'
#' @param complete a list of \code{data.frames} created by \code{summaryResults.DESeq2()} or \code{summaryResults.edgeR()}
#' @param outfile TRUE to export the figure in a png file
#' @return A file named rawpHist.png in the figures directory with one histogram of raw p-values per comparison
#' @author Marie-Agnes Dillies and Hugo Varet

rawpHist <- function(complete, outfile=TRUE){
  nrow <- ceiling(sqrt(length(complete)))
  ncol <- ceiling(length(complete)/nrow)
  if (outfile) png(filename="figures/rawpHist.png", width=1800*max(ncol,nrow), height=1800*min(ncol,nrow), res=300)
    par(mfrow=sort(c(nrow,ncol)))
    for (name in names(complete)){
      hist(complete[[name]][,"pvalue"], nclass=50, xlab="Raw p-value", 
	       col="skyblue", las=1, main=paste0("Distribution of raw p-values - ",gsub("_"," ",name)))
    }
  if (outfile) dev.off()
}
