
######################################################################
# compute mixed effect model
######################################################################
deterministic <- TRUE
modReplicates <- 10000

if(deterministic) set.seed(0)

######################################################################
# recall accuracy
######################################################################
# define stats
mp_model_recallcorrect_fun <- function(dat, idx) {
  fit <- lmer(formula = recallCorrectRatio ~ groupid +  (1 | userid), data = d, subset = idx) 
  s <- summary(fit)
  coef(s)
}
# model for reference
mp_model_recallcorrect <- lmer(formula = recallCorrectRatio ~ groupid +  (1 | userid), data = d) 
# boot!
mp_model_recallcorrect_b <- boot(d, statistic= mp_model_recallcorrect_fun, R=modReplicates, parallel="multicore")
# compute CI
mp_model_recallcorrect_v1 <- boot.ci(mp_model_recallcorrect_b, type = bootMethod, conf =c(0.5, 0.95), index = 2)[[bootMethod]] # group1
mp_model_recallcorrect_v2 <- boot.ci(mp_model_recallcorrect_b, type = bootMethod, conf =c(0.5, 0.95), index = 3)[[bootMethod]] # group2
# form data frame
names <- c("MP", "VRMP")
g1_ra <- c(coef(summary(mp_model_recallcorrect))[2,][[1]], 
           mp_model_recallcorrect_v1[1,][4], mp_model_recallcorrect_v1[1,][5],
           mp_model_recallcorrect_v1[2,][4], mp_model_recallcorrect_v1[2,][5])
g2_ra <- c(coef(summary(mp_model_recallcorrect))[3,][[1]], 
           mp_model_recallcorrect_v2[1,][4], mp_model_recallcorrect_v2[1,][5],
           mp_model_recallcorrect_v2[2,][4], mp_model_recallcorrect_v2[2,][5])
df_model_recallcorrect <- as.data.frame(rbind(g1_ra, g2_ra))
df_model_recallcorrect <- cbind(names, df_model_recallcorrect)
#rename
colnames(df_model_recallcorrect) <- c("whichMP", "meanValue", "lower50", "upper50", "lower95", "upper95")


######################################################################
# recall precision
######################################################################
## repeat for next measure recall precision
# define the statistics
mp_model_recall_fun <- function(dat, idx) {
  fit <- lmer(formula = recallRatio ~ groupid +  (1 | userid), data = d, subset = idx) 
  s <- summary(fit)
  coef(s)
}
# the original model for reference
mp_model_recall <- lmer(formula = recallRatio ~ groupid +  (1 | userid), data = d) 
# boot!
mp_model_recall_b <- boot(d, statistic= mp_model_recall_fun, R=modReplicates, parallel="multicore")
# extract CI for group1 & 2
mp_model_recall_v1 <- boot.ci(mp_model_recall_b, type = bootMethod, conf =c(0.5, 0.95), index = 2)[[bootMethod]] # group1
mp_model_recall_v2 <- boot.ci(mp_model_recall_b, type = bootMethod, conf =c(0.5, 0.95), index = 3)[[bootMethod]] # group2
# form data frame
g1_r <- c(coef(summary(mp_model_recall))[2,][[1]], 
          mp_model_recall_v1[1,][4], mp_model_recall_v1[1,][5],
          mp_model_recall_v1[2,][4], mp_model_recall_v1[2,][5])
g2_r <- c(coef(summary(mp_model_recall))[3,][[1]], 
          mp_model_recall_v2[1,][4], mp_model_recall_v2[1,][5],
          mp_model_recall_v2[2,][4], mp_model_recall_v2[2,][5])
df_model_recall <- as.data.frame(rbind(g1_r, g2_r))
df_model_recall <- cbind(names, df_model_recall)
# rename
colnames(df_model_recall) <- c("whichMP", "meanValue", "lower50", "upper50", "lower95", "upper95")


######################################################################
# recognition accuracy
######################################################################
## repeat for recognition accuracy
# define statistics
mp_model_recogacc_fun <- function(dat, idx) {
  fit <- lmer(formula = recogAccuracy ~ groupid +  (1 | userid), data = d_NA, subset = idx) 
  s <- summary(fit)
  coef(s)
}
# model for recog accuracy
d_NA <- na.omit(d)
mp_model_recogacc <- lmer(formula = recogAccuracy ~ groupid +  (1 | userid), data = d_NA) 
mp_model_recogacc_b <- boot(d, statistic= mp_model_recogacc_fun, R=modReplicates, parallel="multicore")
mp_model_recogacc_v1 <- boot.ci(mp_model_recogacc_b, type = bootMethod, conf =c(0.5, 0.95), index = 2)[[bootMethod]] # group1
mp_model_recogacc_v2 <- boot.ci(mp_model_recogacc_b, type = bootMethod, conf =c(0.5, 0.95), index = 3)[[bootMethod]] # group2

g1_rg <- c(coef(summary(mp_model_recogacc))[2,][[1]], 
           mp_model_recogacc_v1[1,][4], mp_model_recogacc_v1[1,][5],
           mp_model_recogacc_v1[2,][4], mp_model_recogacc_v1[2,][5])
g2_rg <- c(coef(summary(mp_model_recogacc))[3,][[1]], 
           mp_model_recogacc_v2[1,][4], mp_model_recogacc_v2[1,][5],
           mp_model_recogacc_v2[2,][4], mp_model_recogacc_v2[2,][5])
df_model_recogacc <- as.data.frame(rbind(g1_rg, g2_rg))
df_model_recogacc <- cbind(names, df_model_recogacc)
colnames(df_model_recogacc) <- c("whichMP", "meanValue", "lower50", "upper50", "lower95", "upper95")


######################################################################
# recognition confidence
######################################################################
mp_model_recogconf_fun <- function(dat, idx) {
  fit <- lmer(formula = confidenceScore ~ groupid +  (1 | userid), data = d, subset = idx) 
  s <- summary(fit)
  coef(s)
}
mp_model_recogconf <- lmer(formula = confidenceScore ~ groupid +  (1 | userid), data = d) 
mp_model_recogconf_b <- boot(d, statistic= mp_model_recogconf_fun, R=modReplicates, parallel="multicore")
mp_model_recogconf_v1 <- boot.ci(mp_model_recogconf_b, type = bootMethod, conf =c(0.5, 0.95), index = 2)[[bootMethod]] # group1
mp_model_recogconf_v2 <- boot.ci(mp_model_recogconf_b, type = bootMethod, conf =c(0.5, 0.95), index = 3)[[bootMethod]] # group2

g1_rc <- c(coef(summary(mp_model_recogconf))[2,][[1]], 
           mp_model_recogconf_v1[1,][4], mp_model_recogconf_v1[1,][5],
           mp_model_recogconf_v1[2,][4], mp_model_recogconf_v1[2,][5])
g2_rc <- c(coef(summary(mp_model_recogconf))[3,][[1]], 
           mp_model_recogconf_v2[1,][4], mp_model_recogconf_v2[1,][5],
           mp_model_recogconf_v2[2,][4], mp_model_recogconf_v2[2,][5])
df_model_recogconf <- as.data.frame(rbind(g1_rc, g2_rc))
df_model_recogconf <- cbind(names, df_model_recogconf)
colnames(df_model_recogconf) <- c("whichMP", "meanValue", "lower50", "upper50", "lower95", "upper95")


######################################################################
# new idea rate
######################################################################
mp_model_newidea_fun <- function(dat, idx) {
  fit <- lmer(formula = recallNewRatio ~ groupid +  (1 | userid), data = d, subset = idx) 
  s <- summary(fit)
  coef(s)
}
mp_model_newidea <- lmer(formula = recallNewRatio ~ groupid +  (1 | userid), data = d) 
mp_model_newidea_b <- boot(d, statistic= mp_model_newidea_fun, R=modReplicates, parallel="multicore")
mp_model_newidea_v1 <- boot.ci(mp_model_newidea_b, type = bootMethod, conf =c(0.5, 0.95), index = 2)[[bootMethod]] # group1
mp_model_newidea_v2 <- boot.ci(mp_model_newidea_b, type = bootMethod, conf =c(0.5, 0.95), index = 3)[[bootMethod]] # group2

g1_ni <- c(coef(summary(mp_model_newidea))[2,][[1]], 
           mp_model_newidea_v1[1,][4], mp_model_newidea_v1[1,][5],
           mp_model_newidea_v1[2,][4], mp_model_newidea_v1[2,][5])
g2_ni <- c(coef(summary(mp_model_newidea))[3,][[1]], 
           mp_model_newidea_v2[1,][4], mp_model_newidea_v2[1,][5],
           mp_model_newidea_v2[2,][4], mp_model_newidea_v2[2,][5])
df_model_newidea <- as.data.frame(rbind(g1_ni, g2_ni))
df_model_newidea <- cbind(names, df_model_newidea)
colnames(df_model_newidea) <- c("whichMP", "meanValue", "lower50", "upper50", "lower95", "upper95")