library(tidyverse)
library(haven)
library(rio)


time_list =  str_sub(list.files("data/time"), end = -5)

for (i in time_list) {

  dt = read_dta(str_c("data/time/", i, ".dta"))
  
  dt = dt %>% 
    group_by(sch_ep5) %>% 
    arrange(sch_ep5, upl_ayr_ep5, upl_sem_ep5)
  
  xx = dt %>% 
    # mutate(across(zh_know_sch_nb:zh_topic_sch_nb),
    #        .fns = list(cum, ~cumsum(.)))
    mutate(cum_know = cumsum(zh_know_sch_nb),
         cum_exp = cumsum(zh_exp_sch_nb),
         cum_lit = cumsum(zh_lit_sch_nb),
         cum_topic = cumsum(zh_topic_sch_nb))
  
  know = xx %>% 
    select(1:3, 8) %>%
    filter(cum_know == 2) %>% 
    mutate(index = row_number()) %>% 
    filter(index == 1) %>% 
    select(-index) %>% 
    mutate(timepoint = case_when(upl_ayr_ep5 == 2019 & upl_sem_ep5 == 1 ~ 1,
                                 upl_ayr_ep5 == 2019 & upl_sem_ep5 == 2 ~ 2,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 1 ~ 3,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 2 ~ 4,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 1 ~ 5,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 2 ~ 6))
  p.know = know %>%
    group_by(timepoint) %>% 
    summarise(frq = n()) %>% 
    ungroup() %>% 
    mutate(cum_frq = cumsum(frq), name = "國學常識")

# exp ---------------------------------------------------------------------
  exp = xx %>% 
    select(1:3, 9) %>%
    filter(cum_exp == 2) %>% 
    mutate(index = row_number()) %>% 
    filter(index == 1) %>% 
    select(-index) %>% 
    mutate(timepoint = case_when(upl_ayr_ep5 == 2019 & upl_sem_ep5 == 1 ~ 1,
                                 upl_ayr_ep5 == 2019 & upl_sem_ep5 == 2 ~ 2,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 1 ~ 3,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 2 ~ 4,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 1 ~ 5,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 2 ~ 6))
  
  p.exp = exp %>%
    group_by(timepoint) %>% 
    summarise(frq = n()) %>% 
    ungroup() %>% 
    mutate(cum_frq = cumsum(frq), name = "語文表達")

# lit ---------------------------------------------------------------------
  
  lit = xx %>% 
    select(1:3, 10) %>%
    filter(cum_lit == 2) %>% 
    mutate(index = row_number()) %>% 
    filter(index == 1) %>% 
    select(-index) %>% 
    mutate(timepoint = case_when(upl_ayr_ep5 == 2019 & upl_sem_ep5 == 1 ~ 1,
                                 upl_ayr_ep5 == 2019 & upl_sem_ep5 == 2 ~ 2,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 1 ~ 3,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 2 ~ 4,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 1 ~ 5,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 2 ~ 6))
  p.lit = lit %>%
    group_by(timepoint) %>% 
    summarise(frq = n()) %>% 
    ungroup() %>% 
    mutate(cum_frq = cumsum(frq), name = "文學選讀")

# topic ---------------------------------------------------------------------
  
  topic = xx %>% 
    select(1:3, 11) %>%
    filter(cum_topic == 2) %>% 
    mutate(index = row_number()) %>% 
    filter(index == 1) %>% 
    select(-index) %>% 
    mutate(timepoint = case_when(upl_ayr_ep5 == 2019 & upl_sem_ep5 == 1 ~ 1,
                                 upl_ayr_ep5 == 2019 & upl_sem_ep5 == 2 ~ 2,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 1 ~ 3,
                                 upl_ayr_ep5 == 2020 & upl_sem_ep5 == 2 ~ 4,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 1 ~ 5,
                                 upl_ayr_ep5 == 2021 & upl_sem_ep5 == 2 ~ 6))
  
  p.topic = topic %>%
    group_by(timepoint) %>% 
    summarise(frq = n()) %>% 
    ungroup() %>% 
    mutate(cum_frq = cumsum(frq), name = "專題閱讀")
  
  
  plot.df = bind_rows(p.know, p.exp, p.lit, p.topic)
  export(plot.df, file = str_c("data/time/", i, ".xlsx"))
}


  # ggplot(data = plot.df, aes(x = timepoint, y = frq)) +
  #   geom_line(aes(color = name))+
  #   geom_point(aes(color = name), show.legend = F) +
  #   labs(x = "學期", y = "學校數")
  # 
  # ggplot(data = plot.df, aes(x = timepoint, y = cum_frq)) +
  #   geom_line(aes(color = name))+
  #   geom_point(aes(color = name), show.legend = F)

