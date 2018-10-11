completeTime <- ggplot() %>%
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
                        panel.spacing = unit(0.5, "lines"),
                        axis.ticks.length = unit(0.1, "lines"),
                        strip.background =  element_rect(fill = "#EEEEEE"), 
                        strip.placement = "outside",
                        strip.text = element_text(face = "plain"),
                        plot.title = element_text(hjust = 0.5),
                        legend.position = "none",
                        legend.background = element_rect()) %>%
  + geom_point(data = d, aes(x = groupid, y = antiTransferTime(d$totalTime)), size = DOT_SIZE, alpha = 0.075) %>%
  + geom_errorbar(data = d_totalTime, aes(x = groupid, ymax = antiTransferTime(lower95), ymin = antiTransferTime(upper95)), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_totalTime, aes(x = groupid, ymax = antiTransferTime(lower50), ymin = antiTransferTime(upper50)), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_totalTime, aes(x = groupid, color = groupid, ymax = antiTransferTime(meanvalue), ymin = antiTransferTime(meanvalue)), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown3) %>%
  + scale_color_manual(values=palettebrown3) %>%
  + scale_y_continuous(breaks=seq(0, 150, by = 30), limits=c(0,150)) %>%
  + ylab("Completion Time")  %>%
  + coord_flip() %>%
  + xlab("")  %>%
  # + scale_y_continuous(breaks=seq(0, 1.0, by = 0.2), limits=c(-0.1,1.0)) %>%
  + guides(fill=FALSE)
completeTime

readingTime <- ggplot() %>%
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
  #+ geom_hline(yintercept = 0, color = darkgray, linetype="dotted")%>%
  + geom_point(data = d, aes(x = groupid, y = antiTransferTime(d$readingTotalTime)), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(data = d_readingTime, aes(x = groupid, ymax = antiTransferTime(lower95), ymin = antiTransferTime(upper95)), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_readingTime, aes(x = groupid, ymax = antiTransferTime(lower50), ymin = antiTransferTime(upper50)), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_readingTime, aes(x = groupid, color = groupid, ymax = antiTransferTime(meanvalue), ymin = antiTransferTime(meanvalue)), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown3) %>%
  + scale_color_manual(values=palettebrown3) %>%
  + scale_y_continuous(breaks=seq(0, 50, by = 10), limits=c(0,55)) %>%
  + ylab("Time in Reading Session ")  %>%
  + coord_flip() %>%
  + xlab("")  %>%
  # + scale_y_continuous(breaks=seq(0, 1.0, by = 0.2), limits=c(-0.1,1.0)) %>%
  + guides(fill=FALSE)
readingTime


practiceTime <- ggplot() %>%
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
  #+ geom_hline(yintercept = 0, color = darkgray, linetype="dotted")%>%
  + geom_point(data = d, aes(x = groupid, y = antiTransferTime(d$practiceTime)), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(data = d_practiceTime, aes(x = groupid, ymax = antiTransferTime(lower95), ymin = antiTransferTime(upper95)), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_practiceTime, aes(x = groupid, ymax = antiTransferTime(lower50), ymin = antiTransferTime(upper50)), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_practiceTime, aes(x = groupid, color = groupid, ymax = antiTransferTime(meanvalue), ymin = antiTransferTime(meanvalue)), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown3) %>%
  + scale_color_manual(values=palettebrown3) %>%
  + scale_y_continuous(breaks=seq(0, 60, by = 10), limits=c(0,55)) %>%
  + ylab("Time in Practice Session")  %>%
  + coord_flip() %>%
  + xlab("")  %>%
  # + scale_y_continuous(breaks=seq(0, 1.0, by = 0.2), limits=c(-0.1,1.0)) %>%
  + guides(fill=FALSE)
practiceTime


mptrainingTime <- ggplot() %>%
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
  #+ geom_hline(yintercept = 0, color = darkgray, linetype="dotted")%>%
  + geom_point(data = d_MP, aes(x = groupid, y = antiTransferTime(transferTime(d_MP$mpTrainingtime))), size = DOT_SIZE, alpha = 0.075) %>%
  # main effects
  + geom_errorbar(data = d_mpTrainingTime, aes(x = groupid, ymax = antiTransferTime(lower95), ymin = antiTransferTime(upper95)), width = 0.00, size = LINE_SIZE) %>%
  + geom_errorbar(data = d_mpTrainingTime, aes(x = groupid, ymax = antiTransferTime(lower50), ymin = antiTransferTime(upper50)), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = d_mpTrainingTime, aes(x = groupid, color = groupid, ymax = antiTransferTime(meanvalue), ymin = antiTransferTime(meanvalue)), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown3) %>%
  + scale_color_manual(values=palettebrown3) %>%
  + ylab("MP Training Time")  %>%
  + xlab("")  %>%
  + scale_y_continuous(breaks=seq(0, 25, by = 5), limits=c(0,27.5)) %>%
  + coord_flip() %>%
  # + scale_y_continuous(breaks=seq(0, 1.0, by = 0.2), limits=c(-0.1,1.0)) %>%
  + guides(fill=FALSE)
mptrainingTime


pdf('img/time.pdf', width = 5, height = 3.5, useDingbats=FALSE)
multiplot(completeTime, mptrainingTime, practiceTime , readingTime,  cols = 1)
dev.off()