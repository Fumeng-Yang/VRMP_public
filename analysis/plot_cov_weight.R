covFactor <- ggplot() %>%
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
  + geom_errorbar(data = df_cov, aes(x = Cov, ymax = lower95, ymin = upper95), width = 0.00, size = LINE_SIZE*0.75) %>%
  + geom_errorbar(data = df_cov, aes(x = Cov, ymax = lower50, ymin = upper50), width = 0.00, size = LINE_SIZE_WIDE) %>%
  + geom_errorbar(data = df_cov, color = COV_COLOR, aes(x = Cov, ymax = Coef, ymin = Coef), width = 0.75, size = 1) %>%
  + scale_fill_manual(values=palettebrown3) %>%
  + scale_color_manual(values=palettebrown3) %>%
  + ylab("Coefficients")  %>%
  + coord_flip() %>%
  + scale_y_continuous(breaks=seq(-1, 0.6, by=0.2)) %>%
  + guides(fill=FALSE)
covFactor

cov_model
ggsave(file = 'img/cov_model.pdf', plot = covFactor, width = 4, height = 1.5, units = "in")