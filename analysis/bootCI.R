library(boot)
library(PropCIs)

# from https://github.com/Microsoft/RangesOnMobile/blob/master/StudyDataAnalysis/bootCIs.R

deterministic <- TRUE
replicates <- modReplicates <- 10000

significantDigits <- 4
bootMethod <- 'bca'
pairedVar <- TRUE

samplemean <- function(x, d) {
  return(mean(x[d]))
}


cohenDBoot <- function(x, d){
  s <- x[d,]
  # print(d)
  return(cohen.d(s[,1], s[,2], paired = pairedVar)$estimate)
}

# Returns the point estimate and 50 & 95 confidence interval in an array
bootstrapCI <- function(statistic, datapoints, intervalMethod = "bca") {
  # omit na
  datapoints <- na.omit(datapoints)
  # Make the rest of the code deterministic
  if (deterministic) set.seed(0)
  # Generate bootstrap replicates
  b <- boot(datapoints, statistic, R = replicates, parallel="multicore")
  # Compute interval
  if(intervalMethod == "stud"){
    # variances?
    ci <- boot.ci(b, type = c(intervalMethod, "norm"), conf = c(0.5, 0.95))
  }else{
    # sim = "parametric" from small samples?
    ci <- boot.ci(b, type = c(intervalMethod, "norm"), conf = c(0.5, 0.95))  # , sim = "parametric", ran.gen = fun.gen
  }
  # print(ci)   # You can print the ci object for more info and debug
  # Return the point estimate and CI bounds
  lowerBound50 <- ci[[intervalMethod]][1,][4]
  upperBound50 <- ci[[intervalMethod]][1,][5]
  lowerBound95 <- ci[[intervalMethod]][2,][4]
  upperBound95 <- ci[[intervalMethod]][2,][5]
  return(c(lowerBound50, upperBound50, lowerBound95, upperBound95))
}

# Returns the mean and its confidence interval in an array of length 3
bootstrapMeanCI <- function(datapoints) {
  # Compute the point estimate
  datapoints <- na.omit(datapoints)
  pointEstimate <- samplemean(datapoints)
  return(c(pointEstimate, bootstrapCI(samplemean, datapoints)))
}

# Returns the mean and its confidence interval in an array of length 3
bootstrapCohenDCI <- function(data) {
  # Compute the point estimate
  t1 <- data[,1]
  t2 <- data[,2]
  t1 <- na.omit(t1)
  t2 <- na.omit(t2)
  pointEstimate <- cohen.d(t1, t2, paired = pairedVar)$estimate
  return(c(pointEstimate, bootstrapCI(datapoints = data, statistic = cohenDBoot)))
}