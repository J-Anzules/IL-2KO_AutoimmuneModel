#====================================================================
# LIBRARIES + DATA
#====================================================================
library(ggplot2)

ModeldataWT = read.csv("../../Data/ModelOutputWT_final.csv")
ModeldataKO = read.csv("../../Data/ModelOutputKO_final.csv")
WTData = read.csv("../../RawData/ActivatedWTSpleen.csv")
ProlWTData = read.csv("../../RawData/WTProl.csv")
KOData = read.csv("../../RawData/ActivatedKOSpleen.csv")
ProlKOData = read.csv("../../RawData/KOProl.csv")

max(KOData$ActivatedCD4CT)

WTData$hours = WTData$hours / 24
KOData$hours = KOData$hours / 24
ProlWTData$hours = ProlWTData$hours / 24
ProlKOData$hours = ProlKOData$hours / 24

colnames(ModeldataWT) = c("NaiveCT", "ActTCT", "TregCT", "ThyNaive", "ActTNaive", "ThyTregs",
                          "TregNaive", "ProlNaive", "ProlActT", "ProlTreg", "IL-2", "ThymWeigth")
colnames(ModeldataKO) = c("NaiveCT", "ActTCT", "TregCT", "ThyNaive", "ActTNaive", "ThyTregs",
                          "TregNaive", "ProlNaive", "ProlActT", "ProlTreg", "IL-2", "ThymWeigth")

ModeldataWT$time = 0:431
ModeldataKO$time = 0:431
ModeldataWT$time = ModeldataWT$time / 24
ModeldataKO$time = ModeldataKO$time / 24

#====================================================================
# 2) COMMON PARAMETERS
#====================================================================
# Plot size (mm)
width_fig  <- 31.39
height_fig <- 25.29

# point & line sizes
dotsize_mm_WT <- 2.06    # WT symbol diameter (mm)
dotsize_mm_KO <- 1.75    # KO symbol diameter (mm)
linewidth_pt  <- 0.655   # line width in pt

# base theme: no labels, no grids, thin box border
small_theme_clean <- theme_minimal(base_size = 6) +
  theme(
    axis.title    = element_blank(),
    axis.text     = element_blank(),
    axis.ticks.x  = element_line(linewidth = 0.3),
    axis.ticks.y  = element_line(linewidth = 0.3),
    panel.grid    = element_blank(),
    panel.background = element_rect(fill="white", color="black", linewidth=0.4),
    plot.background  = element_blank(),
    plot.margin      = margin(0,0,0,0,"mm")
  )

# summary‐line shortcuts
stat_summary_WT <- stat_summary(
  fun       = mean,
  colour    = "#8c8c8cff",
  geom      = "line",
  linetype  = "dotted",
  size      = linewidth_pt
)
stat_summary_KO <- stat_summary(
  fun       = mean,
  colour    = "black",
  geom      = "line",
  linetype  = "dotted",
  size      = linewidth_pt
)

# point shortcuts
geom_point_WT <- geom_point(shape=17, size=dotsize_mm_WT, colour="#8c8c8cff")
geom_point_KO <- geom_point(size=dotsize_mm_KO, colour="black")

# y‐axis scales (per major population)
scale_y_Naive <- scale_y_continuous(
  limits = c(0,5e6),
  breaks = seq(0,5e6,1e6),
  labels = 0:5
)
scale_y_ActT  <- scale_y_continuous(limits = c(0,7075000))
scale_y_Treg  <- scale_y_continuous(
  limits = c(0,1.05e6),
  breaks = c(0,2e5,4e5,6e5,8e5,1e6),
  labels = c(0,2,5,6,8,10)
)

# base output folder
base_dir <- "../../Plots/Figure3/IndividualPlots"

#====================================================================
# 3) NAIVE T-CELL PANELS
#====================================================================
## WT
# -- Total Naive
p <- ggplot(WTData, aes(hours, NaiveCT)) +
  geom_line(data=ModeldataWT,
            aes(time, NaiveCT),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Naive
ggsave(
  file.path(base_dir,"Naive","WT","NaiveCTWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Proliferating Naive
p <- ggplot(ProlWTData, aes(hours, NaiveProlCT)) +
  geom_line(data=ModeldataWT,
            aes(time, ProlNaive),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Naive
ggsave(
  file.path(base_dir,"Naive","WT","ProlNaiveWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Thymic Naive
p <- ggplot(WTData, aes(hours, ThymicNaive)) +
  geom_line(data=ModeldataWT,
            aes(time, ThyNaive),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Naive
ggsave(
  file.path(base_dir,"Naive","WT","ThymicNaiveWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

## KO
# -- Total Naive
p <- ggplot(KOData, aes(hours, NaiveCT)) +
  geom_line(data=ModeldataKO,
            aes(time, NaiveCT),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Naive
ggsave(
  file.path(base_dir,"Naive","IL2KO","NaiveCTKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Proliferating Naive
p <- ggplot(ProlKOData, aes(hours, NaiveProlCT)) +
  geom_line(data=ModeldataKO,
            aes(time, ProlNaive),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Naive
ggsave(
  file.path(base_dir,"Naive","IL2KO","ProlNaiveKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Thymic Naive
p <- ggplot(KOData, aes(hours, ThymicNaive)) +
  geom_line(data=ModeldataKO,
            aes(time, ThyNaive),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Naive
ggsave(
  file.path(base_dir,"Naive","IL2KO","ThymicNaiveKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)


#====================================================================
# 4) ACTIVATED T-CELL PANELS (ActT)
#====================================================================
## WT
# -- Total Activated
p <- ggplot(WTData, aes(hours, ActivatedCD4CT)) +
  geom_line(data=ModeldataWT,
            aes(time, ActTCT),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_ActT
ggsave(
  file.path(base_dir,"ActT","WT","TotalActTWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Proliferating Activated
p <- ggplot(ProlWTData, aes(hours, ActivatedProlCT)) +
  geom_line(data=ModeldataWT,
            aes(time, ProlActT),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_ActT
ggsave(
  file.path(base_dir,"ActT","WT","ProlActTWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Naive‐Derived Activated
p <- ggplot(WTData, aes(hours, ActivatedNaiveCT)) +
  geom_line(data=ModeldataWT,
            aes(time, ActTNaive),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_ActT
ggsave(
  file.path(base_dir,"ActT","WT","NaiveActTWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

## KO
# -- Total Activated
p <- ggplot(KOData, aes(hours, ActivatedCD4CT)) +
  geom_line(data=ModeldataKO,
            aes(time, ActTCT),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_ActT
ggsave(
  file.path(base_dir,"ActT","IL2KO","TotalActTKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Proliferating Activated
p <- ggplot(ProlKOData, aes(hours, ActivatedProlCT)) +
  geom_line(data=ModeldataKO,
            aes(time, ProlActT),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_ActT
ggsave(
  file.path(base_dir,"ActT","IL2KO","ProlActTKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Naive‐Derived Activated
p <- ggplot(KOData, aes(hours, ActivatedNaiveCT)) +
  geom_line(data=ModeldataKO,
            aes(time, ActTNaive),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_ActT
ggsave(
  file.path(base_dir,"ActT","IL2KO","NaiveActTKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)


#====================================================================
# 5) REGULATORY T-CELL PANELS (Treg)
#====================================================================
## WT
# -- Total Tregs
p <- ggplot(WTData, aes(hours, X4TregCT)) +
  geom_line(data=ModeldataWT,
            aes(time, TregCT),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","WT","TregCTWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Thymic‐Derived Tregs
p <- ggplot(WTData, aes(hours, ThymicDerivedTregsCT)) +
  geom_line(data=ModeldataWT,
            aes(time, ThyTregs),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","WT","ThymicTregWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Naive‐Derived Tregs
p <- ggplot(WTData, aes(hours, NaiveDerivedTregsCT)) +
  geom_line(data=ModeldataWT,
            aes(time, TregNaive),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","WT","NaiveTregWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Proliferating Tregs
p <- ggplot(ProlWTData, aes(hours, X4TregProlCT)) +
  geom_line(data=ModeldataWT,
            aes(time, ProlTreg),
            colour="#8c8c8cff",
            size=linewidth_pt) +
  geom_point_WT +
  stat_summary_WT +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","WT","ProlTregWT.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

## KO
# -- Total Tregs
p <- ggplot(KOData, aes(hours, X4TregCT)) +
  geom_line(data=ModeldataKO,
            aes(time, TregCT),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","IL2KO","TregCTKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Thymic‐Derived Tregs
p <- ggplot(KOData, aes(hours, ThymicDerivedTregsCT)) +
  geom_line(data=ModeldataKO,
            aes(time, ThyTregs),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","IL2KO","ThymicTregKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Naive‐Derived Tregs
p <- ggplot(KOData, aes(hours, NaiveDerivedTregsCT)) +
  geom_line(data=ModeldataKO,
            aes(time, TregNaive),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","IL2KO","NaiveTregKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)

# -- Proliferating Tregs
p <- ggplot(ProlKOData, aes(hours, X4TregProlCT)) +
  geom_line(data=ModeldataKO,
            aes(time, ProlTreg),
            colour="black",
            size=linewidth_pt) +
  geom_point_KO +
  stat_summary_KO +
  small_theme_clean +
  scale_y_Treg
ggsave(
  file.path(base_dir,"Treg","IL2KO","ProlTregKO.pdf"),
  plot   = p, width=width_fig, height=height_fig, units="mm", dpi=300
)