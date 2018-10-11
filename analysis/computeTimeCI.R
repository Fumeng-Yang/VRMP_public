######################################################################
# compute CI for time
######################################################################

s_g1 <- subset(d, groupid == "MP")
s_g2 <- subset(d, groupid == "VRMP")
s_g0 <- subset(d, groupid == " None")
d_MP <- subset(d, MP == "MP")

d_totalTime <- data.frame()
namecomb <- c()
d_readingTime <- data.frame()
d_practiceTime <- data.frame()
d_mpTrainingTime <- data.frame()
namecomeMp <- c()

g0_totalTimeBootCI <- bootstrapMeanCI(transferTime(s_g0$totalTime))
d_totalTime <- rbind(d_totalTime, g0_totalTimeBootCI)

g0_readingTimeBootCI <- bootstrapMeanCI(transferTime(s_g0$readingTotalTime))
d_readingTime <- rbind(d_readingTime, g0_readingTimeBootCI)

g0_practiceTimeBootCI <- bootstrapMeanCI(transferTime(s_g0$practiceTime))
d_practiceTime <- rbind(d_practiceTime, g0_practiceTimeBootCI)
namecomb <- rbind(namecomb, " None")

#################

g1_totalTimeBootCI <- bootstrapMeanCI(transferTime(s_g1$totalTime))
d_totalTime <- rbind(d_totalTime, g1_totalTimeBootCI)

g1_readingTimeBootCI <- bootstrapMeanCI(transferTime(s_g1$readingTotalTime))
d_readingTime <- rbind(d_readingTime, g1_readingTimeBootCI)

g1_practiceTimeBootCI <- bootstrapMeanCI(transferTime(s_g1$practiceTime))
d_practiceTime <- rbind(d_practiceTime, g1_practiceTimeBootCI)

g1_mpTrainingTimeBootCI <- bootstrapMeanCI(transferTime(s_g1$mpTrainingtime))
d_mpTrainingTime <- rbind(d_mpTrainingTime, g1_mpTrainingTimeBootCI)
namecomb <- rbind(namecomb, "MP")
namecomeMp <- rbind(namecomeMp, "MP")

#################

g2_totalTimeBootCI <- bootstrapMeanCI(transferTime(s_g2$totalTime))
d_totalTime <- rbind(d_totalTime, g2_totalTimeBootCI)

g2_readingTimeBootCI <- bootstrapMeanCI(transferTime(s_g2$readingTotalTime))
d_readingTime <- rbind(d_readingTime, g2_readingTimeBootCI)

g2_practiceTimeBootCI <- bootstrapMeanCI(transferTime(s_g2$practiceTime))
d_practiceTime <- rbind(d_practiceTime, g2_practiceTimeBootCI)

g2_mpTrainingTimeBootCI <- bootstrapMeanCI(transferTime(s_g2$mpTrainingtime))
d_mpTrainingTime <- rbind(d_mpTrainingTime, g2_mpTrainingTimeBootCI)

namecomb <- rbind(namecomb, "VRMP")
namecomeMp <- rbind(namecomeMp, "VRMP")

d_totalTime <- cbind(namecomb, d_totalTime)
colnames(d_totalTime) <- c("groupid", "meanvalue", "lower50", "upper50", "lower95" , "upper95")

d_readingTime <- cbind(namecomb, d_readingTime)
colnames(d_readingTime) <- c("groupid", "meanvalue", "lower50", "upper50", "lower95" , "upper95")

d_practiceTime <- cbind(namecomb, d_practiceTime)
colnames(d_practiceTime) <- c("groupid", "meanvalue", "lower50", "upper50", "lower95" , "upper95")

d_mpTrainingTime <- cbind(namecomeMp, d_mpTrainingTime)
colnames(d_mpTrainingTime) <- c("groupid", "meanvalue", "lower50", "upper50", "lower95" , "upper95")

d$totalTime <- transferTime(d$totalTime)
d$readingTotalTime <- transferTime(d$readingTotalTime)
d$practiceTime <- transferTime(d$practiceTime)

totalTime_model <- lmer(formula = totalTime ~ groupid +  (1 | userid), data = d) 
readingTime_model <- lmer(formula = readingTotalTime ~ groupid +  (1 | userid), data = d) 
practiceTime_model <- lmer(formula = practiceTime ~ groupid +  (1 | userid), data = d) 
mpTraining_model <- lmer(formula = mpTrainingtime ~ groupid +  (1 | userid), data = d) 