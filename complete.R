complete <- function(directory='specdata',id=1:332) {
  data <- data.frame(matrix(ncol=2,nrow=0))
  for (i in id) {
    files <- list.files(directory)
    file <- paste(directory,"/",files[i],sep="")
    
    newdata <- read.csv(file)
    file_id <- mean(newdata$ID,na.rm = TRUE)
    file_nobs <- sum(complete.cases(newdata))
    
    row <- c(file_id,file_nobs)
    
    data <- rbind(data,row)
  }
  colnames(data) <- c("id","nobs")
  return(data)
}

complete()