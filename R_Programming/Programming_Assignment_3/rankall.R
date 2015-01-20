## work path
##setwd("F:/Online_Certification/Data_scientist/Data_science/R_Programming/Programming_Assignment_3")



rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    suppressWarnings(data[, 11] <- as.numeric(data[, 11])) # heart attack
    suppressWarnings(data[, 17] <- as.numeric(data[, 17])) # heart failure
    suppressWarnings(data[, 23] <- as.numeric(data[, 23])) # pneumonia
    
    ## Check that state and outcome are valid
        valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
        if(!outcome %in% valid_outcomes) 
        {
            stop("invalid outcome")
        }
    
    state_name <- sort(unique(data$State))
    
    ## init verctor
    hosp_name <- rep("", length(state_name))
    state <- rep("", length(state_name))
    

    for(i in 1:length(state_name)){
        state[i] <- state_name[i]
        if(outcome == "heart attack") {
            hosp_name[i] <- rankState(data, 11, state[i],num)
        } else if(outcome == "heart failure") {
            hosp_name[i] <- rankState(data, 17, state[i],num)
        } else {
            hosp_name[i] <- rankState(data, 23, state[i],num)
        }
    }     
    
    
        
        ## Return hospital name in that state with lowest 30-day death
        result <- data.frame(hospital=hosp_name, state=state)
        return(result)
        ## rate
    
## Subfunctions
## Return hospital name in that state with the given rank
## 30-day death rate

## this subfunction is used for generate result
## "best ==1" ""worse==dim(total_lenth)[1]
rankState <- function(data, col_num, state, num) {
    state_subset <- data[data[, 7]==state, ]
    outcome_arr <- state_subset[, col_num]
    ## total lenth of the vector
    len <- dim(state_subset[!is.na(outcome_arr), ])[1]
    if (class(num) == "character" ){    
        if (num == "worst") {num <- len}
        else if(num == "best"){num <- 1}
        else{print("the num should be interger or best,worst  ")
             stop("invalid rannking")}
    }else if(class(num) == "numeric"){
        num <- num
    }else{
        print("the num should be interger or best,worst  ")
        stop("invalid rannking")
    }
    result <- state_subset[, 2][order(outcome_arr, state_subset[, 2])[num]]
    
    
}

}
      
    
    
    