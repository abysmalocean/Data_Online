setwd("F:/Online_Certification/Data_scientist/Data_science/R_Programming/Programming_Assignment_3")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best <- function(state, outcome) {
    ## Read outcome data
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}