

######################################################################
# aggregate data for each metric (get mean and sd, not used)
# the purpose is to get the names of the groups
######################################################################
recallCorrectRatioMean <- aggregate(data = d, recallCorrectRatio ~ MP + whichMP, mean)
recallCorrectRatioSd <- aggregate(data = d, recallCorrectRatio ~ MP + whichMP, sd)$recallCorrectRatio
d_agg <- data.frame()
d_agg <- cbind(recallCorrectRatioMean, recallCorrectRatioSd)
colnames(d_agg) <- c("MP", "whichMP", "recallCorrectRatio", "recallCorrectRatioSd")

recallNewRatioMean <- aggregate(data = d, recallNewRatio ~ MP + whichMP, mean)$recallNewRatio
recallNewRatioSd <- aggregate(data = d, recallNewRatio ~ MP + whichMP, sd)$recallNewRatio
d_agg <- cbind(d_agg, recallNewRatioMean, recallNewRatioSd)

recallInCorrectRatioMean <- aggregate(data = d, recallInCorrectRatio ~ MP + whichMP, mean)$recallInCorrectRatio
recallInCorrectRatioSd <- aggregate(data = d, recallInCorrectRatio ~ MP + whichMP, sd)$recallInCorrectRatio
d_agg <- cbind(d_agg, recallNewRatioMean, recallNewRatioSd)

recallRatioMean <- aggregate(data = d, recallRatio ~ MP + whichMP, mean)$recallRatio
recallRatioSd <- aggregate(data = d, recallRatio ~ MP + whichMP, sd)$recallRatio
d_agg <- cbind(d_agg, recallRatioMean, recallRatioSd)

recogAccMean <- aggregate(data = d, recogAccuracy ~ MP + whichMP, mean, na.action = na.omit)$recogAccuracy
recallAccSd <- aggregate(data = d, recogAccuracy ~ MP + whichMP, sd, na.action = na.omit)$recogAccuracy
d_agg <- cbind(d_agg, recogAccMean, recallAccSd)

recogConfMean <- aggregate(data = d, confidenceScore ~ MP + whichMP, mean, na.action = na.omit)$confidenceScore
recogConfSd <- aggregate(data = d, confidenceScore ~ MP + whichMP, sd, na.action = na.omit)$confidenceScore
d_agg <- cbind(d_agg, recogConfMean, recogConfSd)

######################################################################
# prepare for containers
######################################################################
d_cond <- data.frame()
d_boot <- data.frame()


######################################################################
# loop through the datasets 
# compute bootstrap for each group / aggregation
######################################################################
for (i in 1:nrow(d_agg)){
  r <- d_agg[i,]

  d_sub <- subset(d, MP == r[,1] & whichMP == r[,2])

  line <- c()
  cond <- c()
  cond <- cbind(cond, as.character(r[[1]]))
  cond <- cbind(cond, as.character(r[[2]]))
    
  recallCorrectRatioBootCI <- bootstrapMeanCI(d_sub$recallCorrectRatio)
  line <- cbind(line, recallCorrectRatioBootCI[1], recallCorrectRatioBootCI[2], recallCorrectRatioBootCI[3], recallCorrectRatioBootCI[4], recallCorrectRatioBootCI[5])
  
  recallNewRatioBootCI <- bootstrapMeanCI(d_sub$recallNewRatio)
  line <- cbind(line, recallNewRatioBootCI[1], recallNewRatioBootCI[2], recallNewRatioBootCI[3], recallNewRatioBootCI[4], recallNewRatioBootCI[5])
  
  recallInCorrectRatioBootCI <- bootstrapMeanCI(d_sub$recallInCorrectRatio)
  line <- cbind(line, recallInCorrectRatioBootCI[1], recallInCorrectRatioBootCI[2], recallInCorrectRatioBootCI[3], recallInCorrectRatioBootCI[4], recallInCorrectRatioBootCI[5])
  
  recallRatioBootCI <- bootstrapMeanCI(d_sub$recallRatio)
  line <- cbind(line, recallRatioBootCI[1], recallRatioBootCI[2], recallRatioBootCI[3], recallRatioBootCI[4], recallRatioBootCI[5])
  
  recogAccBootCI <- bootstrapMeanCI(d_sub$recogAccuracy)
  line <- cbind(line, recogAccBootCI[1], recogAccBootCI[2], recogAccBootCI[3], recogAccBootCI[4], recogAccBootCI[5])
  
  recogConfBootCI <- bootstrapMeanCI(d_sub$confidenceScore)
  line <- cbind(line, recogConfBootCI[1], recogConfBootCI[2], recogConfBootCI[3], recogConfBootCI[4], recogConfBootCI[5])
  
  # print(line)
  d_boot <- rbind(d_boot, line)
  d_cond <- rbind(d_cond, cond)
}


######################################################################
# rename
######################################################################

colnames(d_cond) <- c("MP", "whichMP")
colnames(d_boot) <- c("recallCorrectRatioBootMean", 
                      "recallCorrectRatioBootCI50Lower",
                      "recallCorrectRatioBootCI50Upper",
                      "recallCorrectRatioBootCI95Lower",
                      "recallCorrectRatioBootCI95Upper",
                      "recallNewRatioBootMean", 
                      "recallNewRatioBootCI50Lower",
                      "recallNewRatioBootCI50Upper",
                      "recallNewRatioBootCI95Lower",
                      "recallNewRatioBootCI95Upper",
                      "recallInCorrectRatioBootMean", 
                      "recallInCorrectRatioBootCI50Lower",
                      "recallInCorrectRatioBootCI50Upper",
                      "recallInCorrectRatioBootCI95Lower",
                      "recallInCorrectRatioBootCI95Upper",
                      "recallRatioBootMean", 
                      "recallRatioBootCI50Lower",
                      "recallRatioBootCI50Upper",
                      "recallRatioBootCI95Lower",
                      "recallRatioBootCI95Upper",
                      "recogAccBootMean", 
                      "recogAccBootCI50Lower",
                      "recogAccBootCI50Upper",
                      "recogAccBootCI95Lower",
                      "recogAccBootCI95Upper",
                      "recogConfBootMean", 
                      "recogConfBootCI50Lower",
                      "recogConfBootCI50Upper",
                      "recogConfBootCI95Lower",
                      "recogConfBootCI95Upper")
d_cond$MP <- as.factor(d_cond$MP)
d_cond$whichMP <- as.factor(d_cond$whichMP)

d_bootagg <- data.frame(d_cond, d_boot)



######################################################################
# compute CI after subtracted from the baselines
######################################################################
s_baseline <- subset(d, MP == " None")
s_baseline_MP <- subset(d, MP == " None" & whichMP == "MP")
s_baseline_VRMP <- subset(d, MP == " None" & whichMP == "VRMP")
s_baseline <- s_baseline[order(s_baseline$userid),] 

s_MP_MP <- subset(d, MP != " None" & whichMP == "MP")
s_MP_VRMP <- subset(d, MP != " None" & whichMP == "VRMP")
  
s_MP <- subset(d, MP != " None")
s_MP <- s_MP[order(s_baseline$userid),] 

diffRecallCorrectRatio <-  s_MP$recallCorrectRatio - s_baseline$recallCorrectRatio
diffRecallInCorrectRatio <-  s_MP$recallInCorrectRatio - s_baseline$recallInCorrectRatio
diffRecallRatio <-s_MP$recallRatio - s_baseline$recallRatio
diffRecallNewRatio <-  s_MP$recallNewRatio - s_baseline$recallNewRatio
diffRecogAcc <- s_MP$recogAccuracy - s_baseline$recogAccuracy
diffRecogConf <-  s_MP$confidenceScore - s_baseline$confidenceScore

d_diff <- cbind(s_MP, diffRecallCorrectRatio)
d_diff <- cbind(d_diff, diffRecallInCorrectRatio)
d_diff <- cbind(d_diff, diffRecallRatio)
d_diff <- cbind(d_diff, diffRecallNewRatio)
d_diff <- cbind(d_diff, diffRecogAcc)
d_diff <- cbind(d_diff, diffRecogConf)

d_diff_MP <- subset(d_diff, whichMP == "MP") # MP
d_diff_VRMP <- subset(d_diff, whichMP == "VRMP") #VRMP

combine_diff <- function (MP, VRMP){
  df <- rbind(MP, VRMP)
  df <- rbind(MP, VRMP)
  df <- cbind(c("MP", "VRMP"), df)
  df <- cbind(c(" difference", " difference"), df)
  colnames(df) <- c("MP", "whichMP", "meanvalue", "lower50", "upper50", "lower95", "upper95")
  df <- as.data.frame(df)
  df$MP <- as.factor(df$MP)
  df$whichMP <- as.factor(df$whichMP)
  df$meanvalue <- as.numeric(as.character(df$meanvalue))
  df$lower50 <- as.numeric(as.character(df$lower50))
  df$upper50 <- as.numeric(as.character(df$upper50))
  df$lower95 <- as.numeric(as.character(df$lower95))
  df$upper95 <- as.numeric(as.character(df$upper95))
  return (df)
}

MP_diffRecallCorrectRatioBootCI <- bootstrapMeanCI(d_diff_MP$diffRecallCorrectRatio) # overlap with 0
VRMP_diffRecallCorrectRatioBootCI <- bootstrapMeanCI(d_diff_VRMP$diffRecallCorrectRatio)# NOT overlap with 0
df_diffRecallCorrectRatioBootCI <- combine_diff(MP_diffRecallCorrectRatioBootCI, VRMP_diffRecallCorrectRatioBootCI)

MP_diffRecallInCorrectRatioBootCI <- bootstrapMeanCI(d_diff_MP$diffRecallInCorrectRatio) # overlap with 0
VRMP_diffRecallInCorrectRatioBootCI <- bootstrapMeanCI(d_diff_VRMP$diffRecallInCorrectRatio) # overlap with 0
df_diffRecallInCorrectRatioBootCI <- combine_diff(MP_diffRecallInCorrectRatioBootCI, VRMP_diffRecallInCorrectRatioBootCI)

MP_diffRecallRatioBootCI <- bootstrapMeanCI(d_diff_MP$diffRecallRatio) # overlap with 0
VRMP_diffRecallRatioBootCI <- bootstrapMeanCI(d_diff_VRMP$diffRecallRatio) # NOT overlap with 0
df_diffRecallRatioBootCI <- combine_diff(MP_diffRecallRatioBootCI, VRMP_diffRecallRatioBootCI)

MP_diffRecallNewRatioBootCI <- bootstrapMeanCI(d_diff_MP$diffRecallNewRatio) # overlap with 0
VRMP_diffRecallNewRatioBootCI <- bootstrapMeanCI(d_diff_VRMP$diffRecallNewRatio) #95 overlap with 0
df_diffRecallNewRatioBootCI <- combine_diff(MP_diffRecallNewRatioBootCI, VRMP_diffRecallNewRatioBootCI)

MP_diffRecogAccBootCI <- bootstrapMeanCI(d_diff_MP$diffRecogAcc)# overlap with 0
VRMP_diffRecogAccBootCI <- bootstrapMeanCI(d_diff_VRMP$diffRecogAcc) # overlap with 0
df_diffRecogAccBootCI <- combine_diff(MP_diffRecogAccBootCI, VRMP_diffRecogAccBootCI)

MP_diffRecogConfBootCI <- bootstrapMeanCI(d_diff_MP$diffRecogConf)  # overlap with 0
VRMP_diffRecogConfBootCI <- bootstrapMeanCI(d_diff_VRMP$diffRecogConf) # overlap with 0
df_diffRecogConfBootCI <- combine_diff(MP_diffRecogConfBootCI, VRMP_diffRecogConfBootCI)

