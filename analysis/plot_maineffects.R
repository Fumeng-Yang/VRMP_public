
correctRatios_plot2x2 <- ggplot()  %>%
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
  + geom_point(data = d,  aes(x = MP, y = recallCorrectRatio), size = DOT_SIZE, alpha = 0.075) %>%
  # differences 
  + geom_errorbar(data = df_diffRecallCorrectRatioBootCI, aes(x = MP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_diffRecallCorrectRatioBootCI, aes(x = MP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = df_diffRecallCorrectRatioBootCI, color = DIFF_COLOR, aes(x = MP, ymax = meanvalue, ymin = meanvalue), width = 0.75, size = 1) %>%
  # main effects
  + geom_errorbar(data = d_bootagg, aes(x = MP, ymax = recallCorrectRatioBootCI50Upper, ymin = recallCorrectRatioBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_bootagg, aes(x = MP, ymax = recallCorrectRatioBootCI95Upper, ymin = recallCorrectRatioBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_bootagg, aes(x = MP, color = whichMP : MP, ymax = recallCorrectRatioBootMean, ymin = recallCorrectRatioBootMean), width = 0.75, size = 1) %>%
  #+ geom_point(aes(x = MP, y = recallCorrectRatioBootMean, color = whichMP : MP), size = DOT_SIZE, shape = DOT_SHAPE, stroke = DOT_STROKE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + facet_wrap("whichMP")  %>%
  + ylab("Recall Accuracy")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.005, 0.005), breaks=seq(0, 1.0, by = 0.2), limits=c(-0.06,1.0)) %>%
  + guides(fill=FALSE)
correctRatios_plot2x2

allRatios_plot2x2 <- ggplot()  %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.line.y = element_blank(),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_rect(fill = "white", color = "NA"), 
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
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_point(data = d,  aes(x = MP, y = recallRatio), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(data = d_bootagg, aes(x = MP, ymax = recallRatioBootCI50Upper, ymin = recallRatioBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_bootagg, aes(x = MP, ymax = recallRatioBootCI95Upper, ymin = recallRatioBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_bootagg, aes(x = MP, color = whichMP : MP, ymax = recallRatioBootMean, ymin = recallRatioBootMean), width = 0.75, size = 1) %>%
  # differences 
  + geom_errorbar(data = df_diffRecallRatioBootCI, aes(x = MP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_diffRecallRatioBootCI, aes(x = MP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = df_diffRecallRatioBootCI, color = DIFF_COLOR, aes(x = MP, ymax = meanvalue, ymin = meanvalue), width = 0.75, size = 1) %>%
  # + geom_point(aes(x = MP, y = recallRatioBootMean, color = whichMP : MP), size = DOT_SIZE, shape = DOT_SHAPE, stroke = DOT_STROKE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + ylab("Recall Precision")  %>%
  + facet_wrap("whichMP")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.005, 0.005), breaks=seq(0, 1.0, by = 0.2), limits=c(-0.06,1.0)) %>%
  + guides(fill=FALSE)
allRatios_plot2x2


newRatio_plot2x2 <- ggplot(data = d_bootagg)  %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.line.y = element_blank(),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_rect(fill = "white", color = "NA"), 
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(0.75, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_blank()) %>%
  + geom_point(data = d,  aes(x = MP, y = recallNewRatio), size = DOT_SIZE, alpha = 0.075) %>%
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  # main effects
  + geom_errorbar(aes(x = MP, ymax = recallNewRatioBootCI50Upper, ymin = recallNewRatioBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(aes(x = MP, ymax = recallNewRatioBootCI95Upper, ymin = recallNewRatioBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(aes(x = MP, color = whichMP : MP, ymax = recallNewRatioBootMean, ymin = recallNewRatioBootMean), width = 0.75, size = 1) %>%
  # differences 
  + geom_errorbar(data = df_diffRecallNewRatioBootCI, aes(x = MP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_diffRecallNewRatioBootCI, aes(x = MP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = df_diffRecallNewRatioBootCI, color = DIFF_COLOR, aes(x = MP, ymax = meanvalue, ymin = meanvalue), width = 0.75, size = 1) %>%
  # + geom_point(aes(x = MP, y = recallNewRatioBootMean, color = whichMP : MP), size = DOT_SIZE, shape = DOT_SHAPE, stroke = DOT_STROKE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + facet_wrap("whichMP")  %>%
  + ylab("New Ideas Ratio")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.001, 0.001), breaks=seq(0, 0.16, by = 0.03), limits=c(-0.022,.16)) %>%
  + guides(fill=FALSE)
newRatio_plot2x2

incorrectRatio_plot2x2 <- ggplot(data = d_bootagg)  %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.line.y = element_blank(),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.ticks = element_line(color = darkgray),
          panel.background = element_rect(fill = "white", color = "NA"), 
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
  # main effects
  + geom_errorbar(aes(x = MP, ymax = recallInCorrectRatioBootCI50Upper, ymin = recallInCorrectRatioBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(aes(x = MP, ymax = recallInCorrectRatioBootCI95Upper, ymin = recallInCorrectRatioBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(aes(x = MP, color = whichMP : MP, ymax = recallInCorrectRatioBootMean, ymin = recallInCorrectRatioBootMean), width = 0.75, size = 1) %>%
  # differences 
  + geom_errorbar(data = df_diffRecallInCorrectRatioBootCI, aes(x = MP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_diffRecallInCorrectRatioBootCI, aes(x = MP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = df_diffRecallInCorrectRatioBootCI, color = DIFF_COLOR, aes(x = MP, ymax = meanvalue, ymin = meanvalue), width = 0.75, size = 1) %>%
  # + geom_point(aes(x = MP, y = recallInCorrectRatioBootMean, color = whichMP : MP), size = DOT_SIZE, shape = DOT_SHAPE, stroke = DOT_STROKE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + facet_wrap("whichMP")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.005, 0.005), breaks=seq(0, 0.10, by = 0.025), limits=c(-.10,0.10)) %>%
  + guides(fill=FALSE)
incorrectRatio_plot2x2

recogAcc_plot2x2 <- ggplot(data = d_bootagg)  %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.ticks = element_line(color = darkgray),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          panel.background = element_rect(fill = "white", color = "NA"), 
          panel.grid.major = element_line(colour = "#EFEFEF", size = AXIS_LINE_SIZE / 2, linetype = "solid"), 
          panel.grid.minor = element_blank(),
          axis.line.y = element_blank(),
          panel.spacing = unit(0.75, "lines"),
          axis.ticks.length = unit(0.1, "lines"),
          strip.background =  element_rect(fill = "#EEEEEE"), 
          strip.placement = "outside",
          strip.text = element_text(face = "plain"),
          plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          legend.background = element_rect()) %>%
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_point(data = d,  aes(x = MP, y = recogAccuracy), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(aes(x = MP, ymax = recogAccBootCI50Upper, ymin = recogAccBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(aes(x = MP, ymax = recogAccBootCI95Upper, ymin = recogAccBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(aes(x = MP, color = whichMP : MP, ymax = recogAccBootMean, ymin = recogAccBootMean), width = 0.75, size = 1) %>%
  # differences 
  + geom_errorbar(data = df_diffRecogAccBootCI, aes(x = MP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_diffRecogAccBootCI, aes(x = MP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = df_diffRecogAccBootCI, color = DIFF_COLOR, aes(x = MP, ymax = meanvalue, ymin = meanvalue), width = 0.75, size = 1) %>%
  # + geom_point(aes(x = MP, y = recogAccBootMean, color = whichMP : MP), size = DOT_SIZE, shape = DOT_SHAPE, stroke = DOT_STROKE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + facet_wrap("whichMP")  %>%
  + ylab("Recognition Accuracy")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.005, 0.005), breaks=seq(0, 1.0, by = 0.2), limits=c(-0.06,1.0)) %>%
  + guides(fill=FALSE)
recogAcc_plot2x2


confidenceScore_plot2x2 <- ggplot(data = d_bootagg)  %>%
  + theme(axis.line = element_line(colour = "gray", size = AXIS_LINE_SIZE, linetype = "solid"), 
          axis.text = element_text(size = FONT_SIZE, color = darkgray),
          axis.text.x = element_text(vjust=0.5, hjust=0.5, face="plain"),
          axis.line.y = element_blank(),
          axis.ticks = element_line(color = darkgray),
          axis.title.x = element_text(size = FONT_SIZE, color = darkgray),
          axis.title.y = element_text(size = FONT_SIZE, color = darkgray),
          panel.background = element_rect(fill = "white", color = "NA"), 
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
  + geom_hline(yintercept = 0, color = darkgray, linetype="dotted") %>% # anchor
  + geom_point(data = d,  aes(x = MP, y = confidenceScore), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(aes(x = MP, ymax = recogConfBootCI95Upper, ymin = recogConfBootCI95Lower), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(aes(x = MP, ymax = recogConfBootCI50Upper, ymin = recogConfBootCI50Lower), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(aes(x = MP, color = whichMP : MP, ymax = recogConfBootMean, ymin = recogConfBootMean), width = 0.75, size = 1) %>%
  # differences 
  + geom_errorbar(data = df_diffRecogConfBootCI, aes(x = MP, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_diffRecogConfBootCI, aes(x = MP, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = df_diffRecogConfBootCI, color = DIFF_COLOR, aes(x = MP, ymax = meanvalue, ymin = meanvalue), width = 0.75, size = 1) %>%
  # + geom_point(aes(x = MP, y = recogConfBootMean, color = whichMP : MP), size = DOT_SIZE, shape = DOT_SHAPE, stroke = DOT_STROKE) %>%
  + scale_fill_manual(values=palettebrown) %>%
  + scale_color_manual(values=palettebrown) %>%
  + facet_wrap("whichMP")  %>%
  + ylab("Recognition Confidence")  %>%
  + coord_flip() %>%
  + scale_y_continuous(expand = c(0.01, 0.01), breaks=seq(0, 7, by = 1), limits=c(-0.5,7)) %>%
  + guides(fill=FALSE)
confidenceScore_plot2x2


pdf('img/maineffects.pdf', height = 6, width = 9, useDingbats=FALSE)
multiplot(correctRatios_plot2x2, allRatios_plot2x2, recogAcc_plot2x2, confidenceScore_plot2x2, newRatio_plot2x2, cols = 1)
dev.off()