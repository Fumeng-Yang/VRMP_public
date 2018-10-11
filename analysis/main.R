setwd("/Users/fm/Documents/Github/MemoryPalaceVR_Light/analysis/")

source("helper.R")

# style 
DOT_SIZE <- 1.5
AXIS_LINE_SIZE <- 0.55
LINE_SIZE <- 0.725
LINE_SIZE_WIDE <- 1.425
FONT_SIZE <- 9
STROKE_SIZE <- 0.5

# set colors
darkgray <- "#555555"
DIFF_COLOR <- "#9853aa"
COV_COLOR <- "#9853aa"
POS_COLOR <- "#222222"

palettebrown4 <- c( "steelblue", "#ffa100", "#AAAAAA")
palettebrown3 <- c("#AAAAAA", "steelblue", "#ffa100")
palettebrown2 <- c("#ffa100",  "steelblue", "#AAAAAA")
palettebrown <- c( "#999999",  "steelblue", "#999999", "#ffa100")


# used in bootCI.R and compute different CIs
bootMethod <- 'bca'

# read files
d <- read.csv("../data/meta/all.csv", header = T, stringsAsFactors = T)
vr <- read.csv("../data/vr_data.csv", header = T, stringsAsFactors = T) # slow

# filter participants
# she was errorly assigned to the passages she had read in the first session.
d <- subset(d, userid != "LUCKY06") # errorly assigned the wrong id

# compute features
d$text_ability_code <- code_ability(d$text_ability)
d$visuospatial_code <- code_ability(d$visuospatial)
d$whichMP_code <- code_mp(d$whichMP)

d$totalOrigIdeas <- d$passage1OrigIdeas + d$passage2OrigIdeas + d$passage3OrigIdeas + d$passage4OrigIdeas

d$totalCorrectIdeas <- d$recallCorrectIdea1 + d$recallCorrectIdea2 + d$recallCorrectIdea3 + d$recallCorrectIdea4
d$recallCorrectRatio <- d$totalCorrectIdeas / d$totalOrigIdeas

d$totalNewIdeas <- d$recallNewIdea1 +d$recallNewIdea2 + d$recallNewIdea3 + d$recallNewIdea4
d$recallNewRatio <- d$totalNewIdeas / d$totalOrigIdeas

d$totalIncorrectIdeas <- d$recallInCorrectIdea1 +d$recallInCorrectIdea2 + d$recallInCorrectIdea3 + d$recallInCorrectIdea4
d$recallInCorrectRatio <- d$totalIncorrectIdeas / d$totalOrigIdeas

d$totalRecalledIdeas <- d$totalCorrectIdeas + d$totalNewIdeas + d$totalIncorrectIdeas
d$recallRatio <- d$totalRecalledIdeas / d$totalOrigIdeas


source("computeCI.R")
source("computeTimeCI.R")
source("computeCovCI.R")
source("plot_maineffects.R")
source("plot_cov.R")
source("plot_cov_weight.R")
source("plot_time.R")
source("plot_locomotion.R")
source("plot_controllers.R")

source("computeMixedEffectCI.R") # very slow, about half an hour
source("plot_mixedeffect_model.R")

cohen.kappa(as.matrix(data.frame(d_MP$text_ability_code, s_baseline$text_ability_code))) # weighted kappa    0.79     0.84  0.89
cohen.kappa(as.matrix(data.frame(d_MP$visuospatial_code, s_baseline$visuospatial_code))) # weighted kappa:  0.14     0.59  1.00
