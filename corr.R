corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!

	  ## sum of completed observations
	  studyfiles <- list.files(path = directory, full.names = TRUE)
	  complete_obs <- complete(directory)
	  corr_vect <- c()

	  for(i in 1:nrow(complete_obs)){
		if(complete_obs[i,"nobs"] >= threshold){
		  tempfile <- read.csv(studyfiles[i])[,c("sulfate", "nitrate")]
		  corr_vect <- append(corr_vect, cor(x = tempfile$nitrate, y = tempfile$sulfate, use = "na.or.complete"))
		} else {
		  next
		}
	  }

	  return(corr_vect)
}