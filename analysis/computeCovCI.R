######################################################################
# compute mixed effect model with cov
######################################################################
s_baseline <- droplevels(s_baseline)

standard_fun <- function(d){
   tmp <- (d - min(d))/(max(d) - min(d))
   tmp
}


s_baseline <- s_baseline %>%
  mutate(gender_code = recode(gender, !!!list(female = 1, male = 0))) %>%
  mutate(whichMP_code = recode(whichMP,!!!list(VRMP = 1, MP = 0))) 

s_baseline$age_code <- standard_fun(s_baseline$age)
s_baseline$avgFKIndex_code <- standard_fun(s_baseline$avgFKIndex)
s_baseline$topicInterest_code <- standard_fun(s_baseline$topicInterest)

cov_model <- lm(formula = recallCorrectRatio ~ 
                       gender_code + 
                       text_ability_code + 
                       visuospatial_code + 
                       age_code + 
                       avgFKIndex_code +
                       topicInterest_code +
                       whichMP_code
                     , data = s_baseline) 

cov_model_reg <- function(dat, idx) {
fit <- lm(formula = recallCorrectRatio ~ 
                gender_code + 
                text_ability_code + 
                visuospatial_code + 
                age_code + 
                avgFKIndex_code +
                topicInterest_code +
                whichMP_code
              , data = dat, subset = idx)
  coef(fit)
}

if(deterministic) set.seed(0)

# very slow
cov_model_b <- boot(s_baseline, statistic= cov_model_reg, R=modReplicates, parallel="multicore")
gender_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 2)[[bootMethod]]
text_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 3)[[bootMethod]]
visuospatial_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 4)[[bootMethod]]
age_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 5)[[bootMethod]]
fk_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 6)[[bootMethod]]
topic_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 7)[[bootMethod]]
group_ci <- boot.ci(cov_model_b, type = bootMethod, conf =c(0.5, 0.95), index = 8)[[bootMethod]]

formatCol <- function(ci, v, name){
  l <- c(v, ci[1,][4], ci[1,][5], ci[2,][4], ci[2,][5])
  l
}
df_cov <- data.frame()
df_cov <- rbind(df_cov, formatCol(gender_ci, cov_model_b$t0[[2]], "gender (male)")) 
df_cov <- rbind(df_cov, formatCol(text_ci, cov_model_b$t0[[3]], "text")) 
df_cov <- rbind(df_cov, formatCol(visuospatial_ci, cov_model_b$t0[[4]], "visuo spatial")) 
df_cov <- rbind(df_cov, formatCol(age_ci, cov_model_b$t0[[5]], "age")) 
df_cov <- rbind(df_cov, formatCol(fk_ci, cov_model_b$t0[[6]], "readability")) 
df_cov <- rbind(df_cov, formatCol(topic_ci, cov_model_b$t0[[7]], "topic interest")) 
df_cov <- rbind(df_cov, formatCol(group_ci, cov_model_b$t0[[8]], "group")) 
factorNames <- c("gender(female)", "text ability", "visuospatial", "age", "text difficulty", "topic interest", "group")
df_cov <- cbind(df_cov, factorNames) 
colnames(df_cov) <- c("Coef", "lower50", "upper50", "lower95", "upper95", "Cov")
