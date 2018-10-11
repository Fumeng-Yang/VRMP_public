vr_controller <- subset(vr, device != "Camera")
vr_controller <- droplevels(vr_controller)
controller_x <- ggplot(data = vr_controller)  %>%
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
  + geom_linerange(aes(x = jitter(x, 2.5), ymin = numID + 0.4, ymax = numID - 0.4), alpha = 0.002, size = 0.4, color = POS_COLOR) %>%
  + ylab("Participants")  %>%
  + xlab("Controller - X (meter)")  %>%
  # + coord_flip() %>%
  # + facet_grid(id)  %>%
  + scale_x_continuous(expand = c(0.05, 0.05), breaks=seq(-4,4,by=2), limits=c(-3.8,3.8)) %>%
  + scale_y_reverse(expand = c(0.05, 0.05), breaks=seq(13,1,by=-1)) %>%
  + guides(fill=FALSE)

controller_y <- ggplot(data = vr_controller)  %>%
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
  + geom_linerange(aes(x = jitter(y, 2.5), ymin = numID + 0.4, ymax = numID - 0.4), alpha = 0.002, size = 0.4, color = POS_COLOR) %>%
  + ylab("Participants")  %>%
  + xlab("Controller - Y (meter)")  %>%
  # + coord_flip() %>%
  # + facet_grid(id)  %>%
  + scale_x_continuous(expand = c(0.05, 0.05), breaks=seq(-4,4,by=2), limits=c(-3.8,3.8)) %>%
  + scale_y_reverse(expand = c(0.05, 0.05), breaks=seq(13,1,by=-1)) %>%
  + guides(fill=FALSE)


controller_z <- ggplot(data = vr_controller)  %>%
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
  + geom_linerange(aes(x = jitter(z, 2.5), ymin = numID + 0.4, ymax = numID - 0.4), alpha = 0.002, size = 0.4, color = POS_COLOR) %>%
  + ylab("Participants")  %>%
  + xlab("Controller - Z (meter)")  %>%
  # + coord_flip() %>%
  # + facet_grid(id)  %>%
  + scale_x_continuous(expand = c(0.05, 0.05), breaks=seq(-4,4,by=2), limits=c(-3.8,3.8)) %>%
  + scale_y_reverse(expand = c(0.05, 0.05), breaks=seq(13,1,by=-1)) %>%
  + guides(fill=FALSE)

ggsave(file = 'img/controller-x.png', plot = controller_x, width = 5.2, height = 2, units = "in")
ggsave(file = 'img/controller-y.png', plot = controller_y, width = 5.2, height = 2, units = "in")
ggsave(file = 'img/controller-z.png', plot = controller_z, width = 5.2, height = 2, units = "in")
