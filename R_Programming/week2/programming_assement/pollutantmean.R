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
    Mean_Current
}