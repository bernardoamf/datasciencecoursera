pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

##setwd(directory)
##print(paste(c("Length of list: ",length(id)), collapse = " "))
finalVar <- 0
for(i in 1:length(id))
	{
		##print(paste(c("Started iteration: ",i), collapse = " "))
		if (id[i] < 10) 
			{
				name <- c("00",id[i])
			}
		else if (id[i] < 100)
			{
				name <- c("0",id[i])
			}
		else
			{
				name <- id[i]
			}
		##print("done with name")
		name <- c(".\\",directory,"\\",name, ".csv")
		data <- read.csv(paste(name, collapse = ""))
		##print("Loaded data")
		workingVar <- data[pollutant]
		##print("Set workingVar")

		workingVar <- workingVar[!is.na(workingVar)]
		##print(workingVar)
		##print("Set workingVar minos NA")
		finalVar <- c (finalVar, workingVar)
	}
mean(finalVar)

}
