pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    total_sum  <- 0
    total_length <- 0
    for ( i in id){
        
        filename <- sprintf("%3.3d", i)
        file_path <- paste(directory, "/", filename,".csv",sep="")
        data_inuse <- read.csv(file = file_path)
        process_data <- data_inuse[pollutant]
        process_data <- as.matrix(process_data[!is.na(process_data)])
        total_sum <- sum(process_data) +total_sum
        total_length <- length(process_data) + total_length   
    }
    ##print(total_sum)
    ##print(total_length)
    Mean_Current <- total_sum/total_length
    ##Mean_Current <- mean(x = MEANS,na.rm = TRUE)
    print(Mean_Current)
}

complete <- function(directory = "specdata", id = 1:332) {
    cat(rep("\n",50))
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
    print(complete_case)
}


corr <- function(directory="specdata", threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    ## Return a numeric vector of correlations
    output <- c()
    class(output) <- "numeric"
    for ( i in 1:332){
        filename <- sprintf("%3.3d", i)
        file_path <- paste(directory, "/", filename,".csv",sep="")
        data_inuse <- read.csv(file = file_path)
        current_com <- sum(complete.cases(data_inuse))
            if(current_com > threshold){
                #print(current_com)
                output[length(output)+1] <- cor(x = data_inuse$sulfate,y = data_inuse$nitrate,use = "na.or.complete")
                }
    }
    output
    #print("length")
    #print(length(output))
}

