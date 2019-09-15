
best <- function(state, outcome) {
  ## Read outcome data
  ## Selecting the righ column
  input <- c("heart attack", "heart failure", "pneumonia")
  factor.column <- as.numeric()
  temp_result <- NULL
  
  if(input[1] == outcome){
    factor.column = 11
  } else if(input[2] == outcome ){
    factor.column = 17
  } else if(input[3] == outcome){
    factor.column = 23
  }
  
  ## Read the .csv file
  inputdata <- read.csv("outcome-of-care-measures.csv")
  inputdata[, factor.column] <- as.numeric(inputdata[, factor.column])
  #inputdata[complete.cases(inputdata[, factor.column]), ]
  new_inputdata <- inputdata[inputdata$State == state, ]
  
  ## Check that state and outcome are valid
  if(is.na(match(state, new_inputdata[, 7]))){
    stop('invalid state')
  } else if (is.na(match(outcome, input))){
    stop('invalid outcome')
  }
  
  ## Sorting the data by the outcome
  new_inputdata <- new_inputdata[order(new_inputdata[, factor.column]), ]
  lowest_fatality <- new_inputdata[1,factor.column]
  
  ## Check to see if more than one hospital has the same number
  hospital_duplicate <- which(new_inputdata[,factor.column] == lowest_fatality)
  length_duplicate <- length(hospital_duplicate) 
  
  if(length_duplicate > 1){
    unordered_list <- new_inputdata[hospital_duplicate[1]:hospital_duplicate[length_duplicate],]
    unordered_list[order(unordered_list[,2]), ]
    temp_result <- as.character(unordered_list[1, 2])
  } else {
    temp_result <- as.character(new_inputdata[1, 2])
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  return (temp_result)
}