d_bootagg_baseline <- subset(d_bootagg, MP == " None")
plotbaseline <- ggplot()  %>%
  # + mutate(df_diffRecallCorrectRatioBootCI = fct_reorder(df_diffRecallCorrectRatioBootCI, whichMP)) %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.line.y = element_blank(),
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.ticks = element_line(color = darkgray),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.75, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted")%>%
  + geom_point(data = s_baseline,  aes(x = whichMP, y = recallCorrectRatio), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(data = d_bootagg_baseline, aes(x = whichMP, ymax = recallCorrectRatioBootCI50Upper, ymin = recallCorrectRatioBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_bootagg_baseline, aes(x = whichMP, ymax = recallCorrectRatioBootCI95Upper, ymin = recallCorrectRatioBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_bootagg_baseline, aes(x = whichMP, color = whichMP, ymax = recallCorrectRatioBootMean, ymin = recallCorrectRatioBootMean), width = 0.75, size = 1) %>%
  #+ geom_point(data = d_bootagg_baseline, aes(x = whichMP, y = recallCorrectRatioBootMean, color = whichMP), size = DOT_SIZE, stroke = STROKE_SIZE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + ylab("Recall Accuracy")  %>%
  + xlab("")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.005, 0.005), breaks=seq(0, 1.0, by = 0.2), limits=c(-0.06,1.0)) %>%
  + guides(fill=FALSE)
plotbaseline

ggsave(file = "img/baseline.pdf", width = 3.5, height = 0.8, units = "in")