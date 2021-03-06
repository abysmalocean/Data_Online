complete <- function(directory = "specdata", id = 1:332) {
    ##cat(rep("\n",50))
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
    row_count <- length(id)
    
    current_com <- c()
    count <- 1
    for ( i in id){
        
        filename <- sprintf("%3.3d", i)
        file_path <- paste(directory, "/", filename,".csv",sep="")
        data_inuse <- read.csv(file = file_path)
        current_com[count] <- sum(complete.cases(data_inuse))
        count <- count + 1 
    }
    ##print(id)
    ##print(current_com)
    complete_case <- data.frame(id = id,nobs = current_com)
    complete_case
    
}
