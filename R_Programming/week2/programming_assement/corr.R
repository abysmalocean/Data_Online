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
