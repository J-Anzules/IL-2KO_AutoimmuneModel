
#Total Naive Overlap
TotalNaiveOverlap = ggplot(data=ModeldataWT, aes(x=time, y=NaiveCT)) +
  geom_line(lwd = simLine)+
  geom_line(data = ModeldataKO, aes(x = time, y=NaiveCT), linetype = "dashed", colour = "black", lwd = simLine)+
  theme(panel.background = element_rect(fill = "white", colour = "black", size = 2),
        legend.key = element_rect(fill = "white", colour = "black"),
        legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=20),
        axis.title.y = element_text( colour = "black", size = 20),
        plot.title = element_text(lineheight=.8,  size = 20),
        axis.ticks.length=unit(.25, "cm"),
        text = element_text(size=20))+
  labs(titles = "Total Naive T cells Comparison ", x = "Age in days", y = "Cell Counts")
# scale_y_continuous(limits = c(0,1500000))

YlabelTregOverlap = expression(Cell~Counts~(10^5))
TotalTregOverlap =
ggplot(data=ModeldataWT, aes(x=time, y=TregCT)) +
  geom_line(lwd = 1.5)+
  geom_line(data = ModeldataKO, aes(x = time, y=TregCT), linetype = "dashed", colour = "black", lwd = 1.5)+
  theme(panel.background = element_rect(fill = "white", colour = "black", size = 2),
        legend.key = element_rect(fill = "white", colour = "black"),
        legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=20),
        axis.title.y = element_text( colour = "black", size = 20),
        plot.title = element_text(lineheight=.8,  size = 20),
        axis.ticks.length=unit(.25, "cm"),
        text = element_text(size=20),
        panel.border = element_rect(color = "black",
                                    fill = "NA",
                                    size = 2))+
  labs(titles = "Total Treg Comparison ", x = "Age in days", y = YlabelTregOverlap)+
  scale_y_continuous(limits = c(0,300000), breaks = c(0, 100000, 200000, 300000), label = c(0,1,2,3))


YlabelTregOverlap = expression(Cell~Counts~(10^5))
TotalTregOverlap =
ggplot(data=ModeldataWT, aes(x=time, y=ProlTreg)) +
  geom_line(lwd = 1.5)+
  geom_line(data = ModeldataKO, aes(x = time, y=ProlTreg), linetype = "dashed", colour = "black", lwd = 1.5)+
  theme(panel.background = element_rect(fill = "white", colour = "black", size = 2),
        legend.key = element_rect(fill = "white", colour = "black"),
        legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=20),
        axis.title.y = element_text( colour = "black", size = 20),
        plot.title = element_text(lineheight=.8,  size = 20),
        axis.ticks.length=unit(.25, "cm"), 
        text = element_text(size=20),
        panel.border = element_rect(color = "black",
                                    fill = "NA",
                                    size = 2))+
  labs(titles = "Proliferating Treg Comparison ", x = "Age in days", y = YlabelTregOverlap)+
  scale_y_continuous(limits = c(0,150000), breaks = c(0,50000, 100000, 150000), label = c(0,0.5,1,1.5))

max(ModeldataWT$ProlTreg)

ggsave(file = "../../Plots/Figure3/TotalNaive.pdf", TotalNaiveOverlap)
# height = 4,
# width = 4)


#Overlap of the model lines

NaiveActTOverlap = ggplot(data=ModeldataWT, aes(x=time, y=ActTNaive)) +
  geom_line(lwd = 1.5)+
  geom_line(data = ModeldataKO, aes(x = time, y=ActTNaive), linetype = "dashed", colour = "black", lwd = 2)+
  theme(panel.background = element_rect(fill = "white", colour = "black", size = 2),
        legend.key = element_rect(fill = "white", colour = "black"),
        legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=20),
        axis.title.y = element_text( colour = "black", size = 20),
        plot.title = element_text(lineheight=.8,  size = 20),
        axis.ticks.length=unit(.25, "cm"),
        text = element_text(size=20))+
  labs(titles = "Naive Derived Activated T cells ", x = "Age in days", y = "Cell Counts")+
  scale_y_continuous(limits = c(0,2200000))


ggsave(file = "../../Plots/Figure3/TotalNaive.pdf", TotalNaiveOverlap,
       height = 8.3,
       width = 10)

#Simulation comparison
ggsave(file = "../../Plots/Figure3/Overlap.pdf", NaiveActTOverlap,
       height = 8.3,
       width = 10)