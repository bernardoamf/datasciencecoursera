corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

##setwd(directory)
	completeObservations <- complete(directory,1:332)
	aboveThreshold <- completeObservations[completeObservations$nobs > threshold,]
	v <- vector()
	if (nrow(aboveThreshold) > 0)
	{
		for(i in 1:nrow(aboveThreshold))
			{
				##print(paste(c("Filename: ",aboveThreshold$id[i]), collapse = " "))
				
				if (aboveThreshold$id[i] < 10) 
				{
					name <- c("00",aboveThreshold$id[i])
				}
			else if (aboveThreshold$id[i] < 100)
				{
					name <- c("0",aboveThreshold$id[i])
				}
			else
				{
					name <- aboveThreshold$id[i]
				}
				##print("done with name")
				name <- c(".\\",directory,"\\",name, ".csv")
				##print(name)
				data <- read.csv(paste(name, collapse = ""))
				workingVar <- data[complete.cases(data),]
				##print("Filtered data")
				##print("Counted Rows")
				v <- c(v,cor(workingVar$sulfate, workingVar$nitrate))
				##print("Done with Iteration -------------------------------------")
				
			}
	}
	v
}
