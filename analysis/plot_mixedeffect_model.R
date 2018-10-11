model_recallCorrect <- ggplot() %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.line.y = element_blank(),
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.5, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  # main effects
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_errorbar(data = df_model_recallcorrect, aes(x = whichMP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE*0.75) %>%
  + geom_errorbar(data = df_model_recallcorrect, aes(x = whichMP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_model_recallcorrect, aes(x = whichMP, ymax = meanValue, ymin = meanValue, color = whichMP), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown4) %>%
  + scale_color_manual(values=palettebrown4) %>%
  + ylab("Coefficients")  %>%
  + xlab("")  %>%
  + ggtitle("Recall Accuracy")  %>%
  + coord_flip() %>%
  + scale_y_continuous(breaks=seq(-1, 0.3, by=0.1), limits = c(-0.2, 0.3)) %>%
  + guides(fill=FALSE)


model_recall <- ggplot() %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.line.y = element_blank(),
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.5, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  # main effects
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_errorbar(data = df_model_recall, aes(x = whichMP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE*0.75) %>%
  + geom_errorbar(data = df_model_recall, aes(x = whichMP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_model_recall, aes(x = whichMP, ymax = meanValue, ymin = meanValue, color = whichMP), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown4) %>%
  + scale_color_manual(values=palettebrown4) %>%
  + ylab("Coefficients")  %>%
  + xlab("")  %>%
  + ggtitle("Recall Precision")  %>%
  + coord_flip() %>%
  + scale_y_continuous(breaks=seq(-1, 0.3, by=0.1), limits = c(-0.2, 0.3)) %>%
  + guides(fill=FALSE)


model_recogAcc <- ggplot() %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.line.y = element_blank(),
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.5, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  # main effects
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_errorbar(data = df_model_recogacc, aes(x = whichMP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE*0.75) %>%
  + geom_errorbar(data = df_model_recogacc, aes(x = whichMP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_model_recogacc, aes(x = whichMP, ymax = meanValue, ymin = meanValue, color = whichMP), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown4) %>%
  + scale_color_manual(values=palettebrown4) %>%
  + ylab("Coefficients")  %>%
  + xlab("")  %>%
  + ggtitle("Recognition Accuracy")  %>%
  + coord_flip() %>%
  + scale_y_continuous(breaks=seq(-1, 0.3, by=0.1), limits = c(-0.2, 0.3)) %>%
  + guides(fill=FALSE)

model_recogConf <- ggplot() %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.line.y = element_blank(),
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.5, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  # main effects
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_errorbar(data = df_model_recogconf, aes(x = whichMP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE*0.75) %>%
  + geom_errorbar(data = df_model_recogconf, aes(x = whichMP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_model_recogconf, aes(x = whichMP, ymax = meanValue, ymin = meanValue, color = whichMP), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown4) %>%
  + scale_color_manual(values=palettebrown4) %>%
  + ylab("Coefficients")  %>%
  + xlab("")  %>%
  + ggtitle("Recognition Confidence")  %>%
  + coord_flip() %>%
  + scale_y_continuous(breaks=seq(-1.20, 0.80, by =0.40), limits = c(-1.20, 0.80)) %>%
  + guides(fill=FALSE)

model_newidea <- ggplot() %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.line.y = element_blank(),
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.5, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  # main effects
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_errorbar(data = df_model_newidea, aes(x = whichMP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE*0.75) %>%
  + geom_errorbar(data = df_model_newidea, aes(x = whichMP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_model_newidea, aes(x = whichMP, ymax = meanValue, ymin = meanValue, color = whichMP), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown4) %>%
  + scale_color_manual(values=palettebrown4) %>%
  + ylab("Coefficients")  %>%
  + xlab("")  %>%
  + ggtitle("New Idea Rate")  %>%
  + coord_flip() %>%
  + scale_y_continuous(breaks=seq(-.05, .075, by= .025), limits = c(-.05, .075)) %>%
  + guides(fill=FALSE)

pdf('img/models.pdf', width = 4, height = 5, useDingbats=FALSE)
multiplot(model_recallCorrect, model_recall, model_recogAcc, model_recogConf, model_newidea,  cols = 1)
dev.off()