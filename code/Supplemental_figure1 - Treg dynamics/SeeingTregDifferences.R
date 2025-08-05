library(ggplot2)
library(MASS)
library(scales)
library(ggpubr)
library(rstudioapi)
if (rstudioapi::isAvailable()) {
  script_path <- rstudioapi::getActiveDocumentContext()$path
  setwd(dirname(script_path))
}

WTevery = read.csv("../../Data/ModelOutputEverythingWT_final.csv")
KOevery = read.csv("../../Data/ModelOutputEverythingKO_final.csv")
WTevery$hour = 1:nrow(WTevery)/24
KOevery$hour = 1:nrow(KOevery)/24

lineWT = 2
lineKO = 2
panelSize = 2
xAxisSize = 20
yAxisSize = 30
TitleSize = 30
tixkSize = 30


TregLoss = ggplot() +
  geom_line(data=WTevery, aes(x=hour, y=TregLoss), colour = "#8c8c8cff", lwd = lineWT)+
  geom_line(data=KOevery, aes(x = hour, y=TregLoss), colour = "black", lwd = lineKO)+
  theme(panel.background = element_rect(fill = "white", colour = "black", size = panelSize),
        # legend.key = element_rect(fill = "white", colour = "black"),
        # legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=xAxisSize),
        axis.title.y = element_text( colour = "black", size = yAxisSize),
        plot.title = element_text(lineheight=.8,  size = TitleSize),
        axis.ticks.length=unit(.25, "cm"),
        text = element_text(size=tixkSize))+
  labs(titles = "Treg death rate", x = "Age in days", y = "Cell Counts (log)")+
  scale_y_continuous(trans = log2_trans(),
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))



#------------------------------------------------------------------------
#                             Proliferation
#------------------------------------------------------------------------

TregProl = ggplot(data=WTevery, aes(x=hour, y=ProlTregs)) +
  geom_line(colour = "#8c8c8cff",lwd = lineWT)+
  geom_line(data = KOevery, aes(x = hour, y=ProlTregs), colour = "black", lwd = lineKO)+
  # scale_y_continuous(limits = c(0,30))
  theme(panel.background = element_rect(fill = "white", colour = "black", size = panelSize),
        legend.key = element_rect(fill = "white", colour = "black"),
        legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=xAxisSize),
        axis.title.y = element_text( colour = "black", size = yAxisSize),
        plot.title = element_text(lineheight=.8,  size = TitleSize),
        axis.ticks.length=unit(.25, "cm"),
        text = element_text(size=tixkSize))+
  labs(titles = "Proliferating Tregs", x = "Age in days", y = "Cell count (log)")+
  scale_y_continuous(trans = log2_trans(),
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))

TotalTreg = ggplot() +
  geom_line(data=WTevery, aes(x=hour, y=TregCT), colour = "#8c8c8cff", lwd = lineWT)+
  geom_line(data=KOevery, aes(x = hour, y=TregCT), colour = "black", lwd = lineKO)+
  theme(panel.background = element_rect(fill = "white", colour = "black", size = panelSize),
        # legend.key = element_rect(fill = "white", colour = "black"),
        # legend.background = (element_rect(colour= "black", fill = "white")),
        axis.title.x = element_text( colour="black", size=xAxisSize),
        axis.title.y = element_text( colour = "black", size = yAxisSize),
        plot.title = element_text(lineheight=.8,  size = TitleSize),
        axis.ticks.length=unit(.25, "cm"),
        text = element_text(size=tixkSize))+
  labs(titles = "Total Tregs", x = "Age in days", y = "Cell Counts (log)")+
  scale_y_continuous(trans = log2_trans(),
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x)))


TregDys = ggarrange(TotalTreg, TregLoss, TregProl,
                  ncol = 3, nrow = 1,
                  labels = c("A", "B", "C"),
                  font.label = list(size = 30))




ggsave(file = "../../Plots/SF1/TregDys.pdf", 
       TregDys,
       height = 6,
       width = 18)

