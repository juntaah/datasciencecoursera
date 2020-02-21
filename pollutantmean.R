pollutantmean <- function(directory = 'specdata', pollutant = 'nitrate',id=1:332) {
  data <- data.frame()
  for (i in id) {
    files <- list.files(directory)
    newdata <- read.csv(paste(directory,"/",files[i],sep=""))
    data <- rbind(data,newdata)
  }
  mean(data[[pollutant]],na.rm = TRUE)
}

pollutantmean('specdata','nitrate',23)