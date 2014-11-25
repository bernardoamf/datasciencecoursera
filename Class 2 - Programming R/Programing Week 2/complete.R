complete <- function(directory, id = 1:332) {
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
		
#setwd(directory)
for(i in 1:length(id))
	{
		count = 0;
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
		##print(name)
		data <- read.csv(paste(name, collapse = ""))
		workingVar <- complete.cases(data)
		##print("Filtered data")
		count = sum(as.numeric(workingVar))
		##print("Counted Rows")
		if (i == 1)
		{
			IDList = id[i]
			sumList = count
		}
		else
		{
			IDList <- c(IDList, id[i])
			sumList <- c(sumList, count)
		}
	}
data.frame(id = IDList, nobs = sumList)
}
