best <- function(state, outcome) {
    ## bestState function is used for search the best State when you provide the state and the problem
    
    bestState <- function(data, col_num, state) {
        state_subset <- data[data[, 7]==state, ]
        outcome_arr <- state_subset[, col_num]
        min <- min(outcome_arr, na.rm=TRUE)
        min_index <- which(outcome_arr == min)
        hosp_name <- state_subset[min_index, 2]
        return(hosp_name)
    }
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Change the data type to numeric
    ## you need to suppresswarnings bacause the conversion to numeric has introduct NS to the list
    suppressWarnings(data[, 11] <- as.numeric(data[, 11])) # heart attack
    suppressWarnings(data[, 17] <- as.numeric(data[, 17])) # heart failure
    suppressWarnings(data[, 23] <- as.numeric(data[, 23])) # pneumonia    
    ## Check that state and outcome are valid
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if(!sum(data[,7] == state)) {
        stop("invalid state")
        }else if(!outcome %in% valid_outcomes) 
            {
            stop("invalid outcome")
            }  
                else {
                if(outcome == "heart attack") {
                    hosp_name <- bestState(data, 11, state)
                } else if(outcome == "heart failure") {
                    hosp_name <- bestState(data, 17, state)
                } else {
                    hosp_name <- bestState(data, 23, state)
                }
            ## Return hospital name in that state with lowest 30-day death
            return(hosp_name)
            ## rate
             }
}



# best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")
# best("NY", "hetr attack")
