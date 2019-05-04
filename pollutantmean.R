library("dplyr")

pollutantmean <- function(directory, pollutant, id = 1:332){
    res <- c()
    lastData = NULL
    for(i in id){
        iStr <- formatC(i, width = 3, flag = "0")
        data <- read.csv(paste(directory, "/", iStr, ".csv", sep=""))
        if(!is.null(lastData)){
            data <- rbind(data, lastData)
        }
        lastData <- data
    }
    
    if(pollutant == "sulfate"){
        res <- summarize(data, sulfate = mean(sulfate, na.rm = TRUE))[1,1]
    }
    else{
        res <- summarize(data, nitrate = mean(nitrate, na.rm = TRUE))[1,1]
    }
    res
}
