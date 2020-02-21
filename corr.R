corr <- function(directory, threshold = 0) {
  cr <- c()
  all_files <- list.files(directory)
  for (f in 1:length(all_files)) {
    file <- read.csv(paste(directory,"/",all_files[f],sep=""))
    file_nobs <- sum(complete.cases(file))
    
    if(file_nobs > threshold){
      rows <- file[complete.cases(file),]
      cr <- c(cr,cor(rows$sulfate,rows$nitrate))
    }
  }
  return(cr)
}