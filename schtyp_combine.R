library(data.table)
library(tidyverse)
library(rio)

pub = import("data/pub_schtyp.dta") 
sch_chr = import("data/sch_chr.dta") 

pth = str_sub(list.files("data/2_type/result_2"), end = -5)

for (i in pth) {
  df1 = import(str_c("data/2_type/result_2/", i, ".dta"))
  df1 = df1 %>% 
    separate(sch_ep5, c("scd", NA), sep = "_", remove = F) %>% 
    left_join(pub, by = c("scd" = "then_scd1")) %>% 
    left_join(sch_chr, by = c("scd" = "then_scd1")) %>% 
    mutate(
      ssch_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                          "中正國防幹部預備學校", ssch_scd1),
      pub_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                         "公立", pub_scd1),
      ctycd_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                           12, ctycd_scd1),
      cty_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                         "高雄市", cty_scd1),
      zipcd_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                           830, zipcd_scd1),
      dist_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                          "鳳山區", dist_scd1),
      adr_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                         "高雄市鳳山區凱旋路1號", adr_scd1),
      tscs_lv7_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                              2, tscs_lv7_scd1)
    ) %>% 
    mutate(
      ssch_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                          "敦品中學", ssch_scd1),
      pub_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                         "公立", pub_scd1),
      ctycd_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                           3, ctycd_scd1),
      cty_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                         "桃園市", cty_scd1),
      zipcd_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                           330, zipcd_scd1),
      dist_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                          "桃園區", dist_scd1),
      adr_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                         "桃園市桃園區向善街98號", adr_scd1),
      tscs_lv7_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                              2, tscs_lv7_scd1)
    )
  export(df1, str_c("data/2_type/result_2/", i, ".xlsx"))
}

pth = str_sub(list.files("data/III-type/result_III"), end = -5)

for (i in pth) {
  df1 = import(str_c("data/III-type/result_III/", i, ".dta"))
  df1 = df1 %>% 
    separate(sch_ep5, c("scd", NA), sep = "_", remove = F) %>% 
    left_join(pub, by = c("scd" = "then_scd1")) %>% 
    left_join(sch_chr, by = c("scd" = "then_scd1")) %>% 
    mutate(
      ssch_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                          "中正國防幹部預備學校", ssch_scd1),
      pub_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                         "公立", pub_scd1),
      ctycd_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                           12, ctycd_scd1),
      cty_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                         "高雄市", cty_scd1),
      zipcd_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                           830, zipcd_scd1),
      dist_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                          "鳳山區", dist_scd1),
      adr_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                         "高雄市鳳山區凱旋路1號", adr_scd1),
      tscs_lv7_scd1 = if_else(sch_ep5 == "12M301_中正國防幹部預備學校", 
                              2, tscs_lv7_scd1)
    ) %>% 
    mutate(
      ssch_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                          "敦品中學", ssch_scd1),
      pub_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                         "公立", pub_scd1),
      ctycd_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                           3, ctycd_scd1),
      cty_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                         "桃園市", cty_scd1),
      zipcd_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                           330, zipcd_scd1),
      dist_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                          "桃園區", dist_scd1),
      adr_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                         "桃園市桃園區向善街98號", adr_scd1),
      tscs_lv7_scd1 = if_else(sch_ep5 == "03C301_敦品中學", 
                              2, tscs_lv7_scd1)
    )
  export(df1, str_c("data/III-type/result_III/", i, ".xlsx"))
}



#df1 = import(str_c(pth, "pre_new_1.dta")) %>% select(-soc_stdnt_nb)
#df2 = import(str_c(pth, "pre_new_2.dta")) %>% select(sch_ep5, stdnt_nb)

#df1 = df2 %>% full_join(df1)

# chifrq = bind_rows(df1, df2)
# chifrq = chifrq %>% 
#   group_by(sch_ep5) %>% 
#   summarise_all(max) 

#soc_merge
# df1 = import("220818_高中開課修課狀況分析結果/至少修超過四學分國文加深加廣的各校學生人數及占比_0818_health.xls")
# df2 = import("220818_高中開課修課狀況分析結果/至少修超過四學分國文加深加廣的各校學生人數及占比_0818_pre.xls")
# 
# m4cred = bind_rows(df1, df2)
# m4cred = m4cred %>% 
#   group_by(sch_ep5) %>% 
#   summarise_all(max) 
# 
# m4cred = m4cred %>% 
#   separate(sch_ep5, c("scd", NA), sep = "_", remove = F) %>% 
#   left_join(pub, by = c("scd" = "then_scd1")) %>% 
#   left_join(sch_chr, by = c("scd" = "then_scd1"))
# export(chifrq, "newdata/至少修超過四學分國文加深加廣的各校學生人數及占比_merge.xlsx")


# eng_adv_elect
#names(df)
#out = df %>%
#  mutate(eng_adv_elect = eng_listen_sch + eng_reading_sch + eng_essay_sch,
#         eng_adv_elect_lv = case_when(
#           eng_adv_elect == 0 ~ "0",
#           eng_adv_elect >= 1 & eng_adv_elect <= 2 ~ "1~2",
#           eng_adv_elect >= 3 & eng_adv_elect <= 4 ~ "3~4",
#           eng_adv_elect >= 5 & eng_adv_elect <= 6 ~ "5~6",
#            eng_adv_elect > 6 ~ ">6")) %>%
#   group_by(eng_adv_elect_lv) %>%
#   summarize(snd_for_lang_sch_mean = mean(snd_for_lang_sch), n = n())
# out

