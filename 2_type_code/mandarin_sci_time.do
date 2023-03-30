cd "D:\advanced_electives\data\2_type"

use "lang_adv_electives_sci.dta", clear

destring cr_ep5, replace

//************ 國文 ************//
keep if ustrregexm(subj_ep4, "國學常識|語文表達與傳播應用|各類文學選讀|專題閱讀與研究") == 1

//******* 國學常識 *******//
gen zh_know = cr_ep5 if ustrregexm(subj_ep4, "國學常識") == 1
replace zh_know = 0 if zh_know == .

//學生修課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5 id_nat_ncnu_ep5: egen zh_know_stdnt_cr = total(zh_know)

//學校總開課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5: egen zh_know_sch_nb = max(zh_know_stdnt_cr)

//******* 語文表達與傳播應用 *******//
gen zh_exp = cr_ep5 if ustrregexm(subj_ep4, "語文表達與傳播應用") == 1
replace zh_exp = 0 if zh_exp == .

//學生修課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5 id_nat_ncnu_ep5: egen zh_exp_stdnt_cr = total(zh_exp)

//學校總開課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5: egen zh_exp_sch_nb = max(zh_exp_stdnt_cr)

//******* 各類文學選讀 *******//
gen zh_lit = cr_ep5 if ustrregexm(subj_ep4, "各類文學選讀") == 1
replace zh_lit = 0 if zh_lit == .

//學生修課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5 id_nat_ncnu_ep5: egen zh_lit_stdnt_cr = total(zh_lit)

//學校總開課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5: egen zh_lit_sch_nb = max(zh_lit_stdnt_cr)

//******* 專題閱讀與研究 *******//
gen zh_topic = cr_ep5 if ustrregexm(subj_ep4, "專題閱讀與研究") == 1
replace zh_topic = 0 if zh_topic == .

//學生修課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5 id_nat_ncnu_ep5: egen zh_topic_stdnt_cr = total(zh_topic)

//學校總開課學分數
bysort upl_ayr_ep5 upl_sem_ep5 sch_ep5: egen zh_topic_sch_nb = max(zh_topic_stdnt_cr)

//******* 學校國文總開課數-時間分布 *******//
keep upl_ayr_ep5 upl_sem_ep5 sch_ep5 zh_know_sch_nb zh_exp_sch_nb zh_lit_sch_nb zh_topic_sch_nb

duplicates drop

drop if sch_ep5 == "801M01_私立東莞台商子弟學校" | sch_ep5 == "801M02_私立華東臺商子女學校" | sch_ep5 == "801M03_私立上海台商子女學校"

cd "D:\advanced_electives\data\time"

save "學校國文總開課數(學分數)-時間分布_0818_sci.dta", replace
