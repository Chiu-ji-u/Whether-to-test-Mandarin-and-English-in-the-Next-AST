cd "D:\advanced_electives\data"

use "ep5_total_socsci_gr3_pre_III.dta", clear

keep if stdnt_attr == "自然組(無生物)"

//******* 只保留語文領域或第二外語 *******//
keep if ustrregexm(fld_ep4, "語文領域|第二外國語文") == 1

cd "D:\advanced_electives\data\III-type"

save "lang_adv_electives_sci_eng.dta", replace

destring cr_ep5, replace

//************ 國文 ************//
keep if ustrregexm(subj_ep4, "國學常識|語文表達與傳播應用|各類文學選讀|專題閱讀與研究") == 1

//******* 國學常識 *******//
gen zh_know = cr_ep5 if ustrregexm(subj_ep4, "國學常識") == 1
replace zh_know = 0 if zh_know == .

//學生修課學分數
bysort sch_ep5 id_nat_ncnu_ep5: egen zh_know_stdnt_cr = total(zh_know)

//學校總開課學分數
bysort sch_ep5: egen zh_know_sch_nb = max(zh_know_stdnt_cr)

//******* 語文表達與傳播應用 *******//
gen zh_exp = cr_ep5 if ustrregexm(subj_ep4, "語文表達與傳播應用") == 1
replace zh_exp = 0 if zh_exp == .

//學生修課學分數
bysort sch_ep5 id_nat_ncnu_ep5: egen zh_exp_stdnt_cr = total(zh_exp)

//學校總開課學分數
bysort sch_ep5: egen zh_exp_sch_nb = max(zh_exp_stdnt_cr)

//******* 各類文學選讀 *******//
gen zh_lit = cr_ep5 if ustrregexm(subj_ep4, "各類文學選讀") == 1
replace zh_lit = 0 if zh_lit == .

//學生修課學分數
bysort sch_ep5 id_nat_ncnu_ep5: egen zh_lit_stdnt_cr = total(zh_lit)

//學校總開課學分數
bysort sch_ep5: egen zh_lit_sch_nb = max(zh_lit_stdnt_cr)

//******* 專題閱讀與研究 *******//
gen zh_topic = cr_ep5 if ustrregexm(subj_ep4, "專題閱讀與研究") == 1
replace zh_topic = 0 if zh_topic == .

//學生修課學分數
bysort sch_ep5 id_nat_ncnu_ep5: egen zh_topic_stdnt_cr = total(zh_topic)

//學校總開課學分數
bysort sch_ep5: egen zh_topic_sch_nb = max(zh_topic_stdnt_cr)

save "mandarin_sci_eng.dta", replace

//******* 學校國文總開課數分布 *******//
keep sch_ep5 zh_know_sch_nb zh_exp_sch_nb zh_lit_sch_nb zh_topic_sch_nb
duplicates drop

save "result_III\學校國文總開課數分布(學分數)_0829_sci_eng.dta", replace

use "all_stdnt_nb_III.dta", clear
merge 1:1 sch using "result_III\學校國文總開課數分布(學分數)_0829_sci_eng.dta"
replace zh_know_sch_nb = 0 if zh_know_sch_nb == .
replace zh_exp_sch_nb = 0 if zh_exp_sch_nb == .
replace zh_lit_sch_nb = 0 if zh_lit_sch_nb == .
replace zh_topic_sch_nb = 0 if zh_topic_sch_nb == .
drop _merge
drop bio_med_stdnt_nb soc_stdnt_nb both_stdnt_nb none_stdnt_nb stdnt_nb
save "result_III\學校國文總開課數分布(學分數)_0829_sci_eng.dta", replace

//******* 各校國文修過人數分布 *******//
use "all_stdnt_nb_III.dta", clear
merge 1:m sch_ep5 using "mandarin_sci_eng.dta"
drop _merge

keep sch_ep5 sci_eng_stdnt_nb id_nat_ncnu_ep5 zh_know_stdnt_cr zh_exp_stdnt_cr zh_lit_stdnt_cr zh_topic_stdnt_cr

duplicates drop sch_ep5 sci_eng_stdnt_nb id_nat_ncnu_ep5 zh_know_stdnt_cr zh_exp_stdnt_cr zh_lit_stdnt_cr zh_topic_stdnt_cr, force

//calculate the number of enrollment
gen zh_know_enroll = 1 if zh_know_stdnt_cr > 0
replace zh_know_enroll = 0 if zh_know_enroll == . 
gen zh_exp_enroll = 1 if zh_exp_stdnt_cr > 0
replace zh_exp_enroll = 0 if zh_exp_enroll == . 
gen zh_lit_enroll = 1 if zh_lit_stdnt_cr > 0
replace zh_lit_enroll = 0 if zh_lit_enroll == . 
gen zh_topic_enroll = 1 if zh_topic_stdnt_cr > 0
replace zh_topic_enroll = 0 if zh_topic_enroll == . 

bysort sch_ep5: egen zh_know_enroll_sch = total(zh_know_enroll)
bysort sch_ep5: egen zh_exp_enroll_sch = total(zh_exp_enroll)
bysort sch_ep5: egen zh_lit_enroll_sch = total(zh_lit_enroll)
bysort sch_ep5: egen zh_topic_enroll_sch = total(zh_topic_enroll)

drop id_nat_ncnu_ep5 zh_know_stdnt_cr zh_exp_stdnt_cr zh_lit_stdnt_cr zh_topic_stdnt_cr zh_know_enroll zh_exp_enroll zh_lit_enroll zh_topic_enroll

duplicates drop

save "result_III\各校國文修過人數分布_0829_sci_eng.dta", replace

//******* 學生國文加深加廣實際選修學分數 *******//
use "all_stdnt_nb_III.dta", clear
merge 1:m sch_ep5 using "mandarin_sci_eng.dta"
drop _merge

bysort id_nat_ncnu_ep5: egen zh_elect_cr = total(cr_ep5)

//create a dummy for fully taking more than 4 credits for Mandarin advanced electives
preserve
gen pass = 1 if zh_elect_cr >= 4
replace pass = 0 if pass == .

keep sch_ep5 id_nat_ncnu_ep5 sci_eng_stdnt_nb pass
duplicates drop sch_ep5 id_nat_ncnu_ep5 pass, force

bysort sch_ep5: egen pass_sch = total(pass)
drop id_nat_ncnu_ep5 pass
duplicates drop

save "result_III\至少修超過四學分國文加深加廣的各校學生人數及占比_0829_sci_eng.dta", replace
restore

//calculate average credit of Mandarin
keep sch_ep5 id_nat_ncnu_ep5 sci_eng_stdnt_nb zh_elect_cr
duplicates drop sch_ep5 id_nat_ncnu_ep5 zh_elect_cr, force

bysort sch_ep5: egen zh_elect_cr_avg_sch = mean(zh_elect_cr)
drop id_nat_ncnu_ep5 zh_elect_cr
duplicates drop

save "result_III\國文加深加廣各校學生平均修課學分數_0829_sci_eng.dta", replace





