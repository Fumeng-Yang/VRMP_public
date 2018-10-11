d_half <- subset(d, groupid == " None")

age_hist <- ggplot(data = d_half, aes(x = age, fill=whichMP))  %>%
  + theme(axis.line = element_line(colour = "gray", size = 0.5, linetype = "solid"), 
          panel.background = element_rect(fill = "white"), 
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          plot.margin = margin(0.05, 0.05, 0.05, 0.05, "cm"),
          legend.position = "none") %>%
  + geom_histogram(bins=4, alpha = 0.65, stroke = 1, color = "white") %>%
  + scale_fill_manual(values=palettebrown2) %>%
  + scale_color_manual(values=palettebrown2) %>%
  + xlab("age") %>%
  + ylab("")%>%
  + guides(fill=FALSE)
age_hist


gender_hist <- ggplot(data = d_half, aes(x = gender, fill=whichMP))  %>%
  + theme(axis.line = element_line(colour = "gray", size = 0.5, linetype = "solid"), 
          panel.background = element_rect(fill = "white"), 
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          plot.margin = margin(0.05, 0.05, 0.05, 0.05, "cm"),
          legend.position = "none") %>%
  + geom_histogram(bins=4,stat = "count", alpha = 0.65, stroke = 1, color = "white") %>%
  + scale_fill_manual(values=palettebrown2) %>%
  + scale_color_manual(values=palettebrown2) %>%
  + xlab("gender") %>%
  + ylab("")%>%
  + guides(fill=FALSE)
gender_hist

interest_hist <- ggplot(data = d, aes(x = topicInterest, fill=whichMP))  %>%
  + theme(axis.line = element_line(colour = "gray", size = 0.5, linetype = "solid"), 
          panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),legend.position = "none") %>%
  + geom_histogram(bins=4, alpha = 0.65, stroke = 1, color = "white") %>%
  + scale_fill_manual(values=palettebrown2) %>%
  + scale_color_manual(values=palettebrown2) %>%
  + xlab("topic interest") %>%
  + ylab("")%>%
  + guides(fill=FALSE)
interest_hist


verbal_hist <- ggplot(data = d_half, aes(x = text_ability_code, fill=whichMP))  %>%
  + theme(axis.line = element_line(colour = "gray", size = 0.5, linetype = "solid"), 
          panel.background = element_rect(fill = "white"), 
          panel.grid.major = element_blank(), panel.grid.minor = element_blank(),legend.position = "none") %>%
  + geom_histogram(bins=4, alpha = 0.65, stroke = 1, color = "white") %>%
  + scale_fill_manual(values=palettebrown2) %>%
  + scale_color_manual(values=palettebrown2) %>%
  + xlab("text ability") %>%
  + ylab("")%>%
  + guides(fill=FALSE)
verbal_hist


vp_hist <- ggplot(data = d_half, aes(x = visuospatial_code, fill=whichMP))  %>%
  + theme(axis.line = element_line(colour = "gray", size = 0.5, linetype = "solid"), 
          panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),legend.position = "none") %>%
  + geom_histogram(bins=4, alpha = 0.65, stroke = 1, color = "white") %>%
  + scale_fill_manual(values=palettebrown2) %>%
  + scale_color_manual(values=palettebrown2) %>%
  + xlab("visuospatial") %>%
  + ylab("")%>%
  + guides(fill=FALSE)
vp_hist


diffcl <- ggplot(data = d, aes(x = avgFKIndex, fill=whichMP))  %>%
  + theme(axis.line = element_line(colour = "gray", size = 0.5, linetype = "solid"), 
          plot.margin = margin(0.05, 0.05, 0.05, 0.05, "cm"),
          panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),legend.position = "none") %>%
  + geom_histogram(bins = 4, alpha = 0.65, stroke = 1, color = "white") %>%
  + scale_fill_manual(values=palettebrown2) %>%
  + scale_color_manual(values=palettebrown2) %>%
  + xlab("text difficulty") %>%
  + ylab("")%>%
  + guides(fill=FALSE)
diffcl

pdf('img/cov.pdf', width = 9.2, height = 1.3, useDingbats=FALSE)
multiplot(age_hist,gender_hist,interest_hist, verbal_hist, vp_hist, diffcl, cols = 6)
dev.off()
