
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files.

  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

  ## Answer

  studyfiles <- list.files(path = directory, full.names = TRUE)
  listofdata <- as.list(rep(0, length(id)))  

   ## listofdata[i] <- read.csv(studyfiles[i])[,pollutant]

   lapply(listofdata, mean, na.rm = TRUE)
}


