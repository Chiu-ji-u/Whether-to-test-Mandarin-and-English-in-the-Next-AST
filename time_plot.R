library(tidyverse)
library(openxlsx)
library(readxl)
library(wesanderson)

dt = read_xlsx("data/time/學校國文總開課數(學分數)-時間分布_0818.xlsx")
dt_sci = read_xlsx("data/time/學校國文總開課數(學分數)-時間分布_0818_sci.xlsx")
dt_soc = read_xlsx("data/time/學校國文總開課數(學分數)-時間分布_0818_soc.xlsx")
dt_bio_med = read_xlsx("data/time/學校國文總開課數(學分數)-時間分布_0829_bio_med.xlsx")
dt_sci_eng = read_xlsx("data/time/學校國文總開課數(學分數)-時間分布_0829_sci_eng.xlsx")


ggplot(data = dt, aes(x = timepoint, y = frq, color = name)) +
  geom_line(aes(color = name))+
  geom_point(aes(shape = name, color = name), size = 2.5) +
  scale_x_continuous(breaks = c(1:6), labels = c("高一上", "高一下",
                                                 "高二上", "高二下",
                                                 "高三上", "高三下")) +
  scale_y_continuous(breaks = seq(0,175,25)) +
  labs(x = "", y = "各學期開滿至少2學分學校數", color = "課程") +
  guides(colour = guide_legend(override.aes = list(shape = c(16,17,15,3))), shape = "none") +
  theme_minimal()

ggsave("國文學校總數.png", units="in", width=5, height=4, dpi=600) 

ggplot(data = dt_sci, aes(x = timepoint, y = frq, color = name)) +
  geom_line(aes(color = name), size = 0.3)+
  geom_point(aes(shape = name, color = name), size = 2.5) +
  scale_x_continuous(breaks = c(1:6), labels = c("高一上", "高一下",
                                                 "高二上", "高二下",
                                                 "高三上", "高三下")) +
  scale_y_continuous(breaks = seq(0,175,25)) +
  labs(x = "", y = "各學期開滿至少2學分學校數(自然組)", color = "課程") +
  guides(colour = guide_legend(override.aes = list(shape = c(16,17,15,3))), shape = "none") +
  theme_minimal()

ggsave("國文學校（自然組）.png", units="in", width=5, height=4, dpi=600)


ggplot(data = dt_soc, aes(x = timepoint, y = frq, color = name)) +
  geom_line(aes(color = name), size = 0.3)+
  geom_point(aes(shape = name, color = name), size = 2.5) +
  scale_x_continuous(breaks = c(1:6), labels = c("高一上", "高一下",
                                                 "高二上", "高二下",
                                                 "高三上", "高三下")) +
  scale_y_continuous(breaks = seq(0,175,25)) +
  labs(x = "", y = "各學期開滿至少2學分學校數(社會組)", color = "課程") +
  guides(colour = guide_legend(override.aes = list(shape = c(16,17,15,3))), shape = "none") +
  theme_minimal()


ggsave("國文學校（社會組）.png", units="in", width=5, height=4, dpi=600)


ggplot(data = dt_sci_eng, aes(x = timepoint, y = frq, color = name)) +
  geom_line(aes(color = name), size = 0.3)+
  geom_point(aes(shape = name, color = name), size = 2.5) +
  scale_x_continuous(breaks = c(1:6), labels = c("高一上", "高一下",
                                                 "高二上", "高二下",
                                                 "高三上", "高三下")) +
  scale_y_continuous(breaks = seq(0,175,25)) +
  labs(x = "", y = "各學期開滿至少2學分學校數(二類組)", color = "課程") +
  guides(colour = guide_legend(override.aes = list(shape = c(16,17,15,3))), shape = "none") +
  theme_minimal() 
  
ggsave("國文學校（二類組）.png", units="in", width=5, height=4, dpi=600)


ggplot(data = dt_bio_med, aes(x = timepoint, y = frq, color = name)) +
  geom_line(aes(color = name), size = 0.6)+
  geom_point(aes(shape = name, color = name), size = 2.5) +
  scale_x_continuous(breaks = c(1:6), labels = c("高一上", "高一下",
                                                 "高二上", "高二下",
                                                 "高三上", "高三下")) +
  scale_y_continuous(breaks = seq(0,175,25)) +
  labs(x = "", y = "各學期開滿至少2學分學校數(三類組)", color = "課程") +
  guides(colour = guide_legend(override.aes = list(shape = c(16,17,15,3))), shape = "none") +
  theme_minimal()


ggsave("國文學校（三類組）.png", units="in", width=5, height=4, dpi= 600)


# 累積的
# ggplot(data = dt, aes(x = timepoint, y = cum_frq, color = name)) +
#   geom_line(aes(color = name))+
#   geom_point(aes(shape = name, color = name), size = 2) +
#   scale_x_continuous(breaks = c(1:6), labels = c("高一上", "高一下",
#                                                  "高二上", "高二下",
#                                                  "高三上", "高三下")) +
#   labs(x = "", y = "累積開滿至少2學分學校數", color = "課程") +
#   guides(colour = guide_legend(override.aes = list(shape = c(16,17,15,3))), shape = "none")



# xx = dt_soc %>% select(-cum_frq) %>%
#   spread(name, frq)
# 
# write.xlsx(xx,
#            "C:/Users/User/Desktop/plot_chielective_wide_soc.xlsx",
#            encoding = "UTF-8")
