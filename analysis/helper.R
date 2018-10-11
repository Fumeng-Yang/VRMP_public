if(!require(lmtest)) install.packages("lmtest")  # likelihood test
if(!require(aod)) install.packages("aod")
if(!require(arm)) install.packages("arm")
if(!require(pscl)) install.packages("pscl")
if(!require(car)) install.packages("car")
if(!require(psych)) install.packages("psych") # cohen's kappa

# estimate
#if(!require(kernelboot)) install.packages("kernellboot")
if(!require(PropCIs)) install.packages("PropCIs")
if(!require(boot)) install.packages("boot")

# modeling
if(!require(gamlss)) install.packages("gamlss")
if(!require(lme4)) install.packages("lme4")
if(!require(nlme)) install.packages("nlme")
if(!require(MuMIn)) install.packages("MuMIn")
if(!require(optimx)) install.packages("optimx")

if(!require(ggplot2)) install.packages("ggplot2")
if(!require(plyr)) install.packages("plyr")
if(!require(dplyr)) install.packages("dplyr")

if(!require(Hotelling)) install.packages("Hotelling")
if(!require(corrplot)) install.packages("corrplot") # cor matrix
if(!require(qtlcharts)) install.packages("qtlcharts")
if(!require(pwr)) install.packages("pwr") # power analysis
if(!require(effsize)) install.packages("effsize")
if(!require(moments)) install.packages("moments")
if(!require(coin)) install.packages("coin")

rm(list = setdiff(ls(), lsf.str()))

source("bootCI.R")

code_ability <- function(e){
  tmp <- rep(1, length(e))
  tmp[e=="not_very_good_at"] <- 0
  tmp[e=="average"] <- 0.33
  tmp[e=="better_than_average"] <- 0.67
  tmp[e=="very_good"] < 1
  
  return (tmp)
}

code_mp <- function(e){
  tmp <- rep(2, length(e))
  tmp[e=="MP"] <- 0
  tmp[e=="VRMP"] <- 1
  
  return (tmp)
}


code_gender <- function(e){
  tmp <- rep(2, length(e))
  tmp[e=="male"] <- 0
  tmp[e=="female"] <- 1
  print(tmp)
  return (tmp)
}

code_vr <- function(e){
  tmp <- rep(1, length(e))
  tmp[e=="not_very_good_at"] <- 0
  tmp[e=="average"] <- 0.33
  tmp[e=="better_than_average"] <- 0.67
  tmp[e=="very_good"] < 1
  
  return (tmp)
}

transferTime <- function(mls){
  return (log2(mls / 60000))
}

antiTransferTime <- function(t){
  return (2^(t))
}


multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  numPlots = length(plots)
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  if (numPlots==1) {
    print(plots[[1]])
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
