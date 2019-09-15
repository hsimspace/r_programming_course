complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

	  ## Create two vectors to fill in monitor's ID and nobs
	  monitorID <- c()
	  nobs <- c()
	  stations <- list.files(path = directory, full.names = TRUE)

	  ## Nested for
	  for(i in id){
		tempread <- read.csv(stations[i])
		count_nobs <- 0
		monitorID <- append(monitorID, i)

		for(j in 1:nrow(tempread)){
		  if(!any(is.na(tempread[j, ]))){
			count_nobs <- count_nobs + 1
		  }
		}
		nobs <- append(nobs, count_nobs)
	  }
	  
	  results <- data.frame(monitorID, nobs)
	  results	  
}