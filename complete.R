library("dplyr")

complete <- function(directory, id = 1:332){
    newDataFrame <- data.frame(matrix(ncol = 2, nrow = 0))
    colnames(newDataFrame) <- c("id", "nobs")
    
    for(i in id){
        iStr <- formatC(i, width = 3, flag = "0")
        data <- read.csv(paste(directory, "/", iStr, ".csv", sep=""))
        sumData <- filter(data, sulfate != "NA")
        sumData <- filter(sumData, nitrate != "NA")
        newDataFrame[nrow(newDataFrame)+1, ] <- list(id = i, nobs = nrow(sumData))
    }
    newDataFrame
}
