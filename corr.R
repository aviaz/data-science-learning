library("dplyr")
source("complete.R")

corr <- function(directory, threshold = 0){
    res <- c()
    df <- complete(directory)
    for(i in 1:nrow(df)){
        row <- df[i, ]
        if((row[2])[1,1] >= threshold){
            iStr <- formatC((row[1])[1,1], width = 3, flag = "0")
            data <- read.csv(paste(directory, "/", iStr, ".csv", sep=""))
            sumData <- filter(data, !is.na(sulfate))
            sumData <- filter(sumData, !is.na(nitrate))
            
            if(nrow(sumData) > 0){
                index <- length(res) + 1
                res[index] <- summarize(sumData, corr = cor(sulfate, nitrate))[1,1]
            }
        }
    }
    res
}
