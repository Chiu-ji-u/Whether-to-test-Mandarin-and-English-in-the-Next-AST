cd "D:\advanced_electives\data\2_type\"

//************ 英文和第二外語 ************//
use "lang_adv_electives_sci.dta", clear

destring cr_ep5, replace

drop if ustrregexm(subj_ep4, "國學常識|語文表達與傳播應用|各類文學選讀|專題閱讀與研究") == 1

gen snd_for_lang = 1 if ustrregexm(fld_ep4, "第二外國語文") == 1
replace snd_for_lang = 0 if snd_for_lang == .

gen eng_adv_elect = 1 if ustrregexm(subj_ep4, "英語聽講|英文閱讀與寫作|英文作文") == 1
replace eng_adv_elect = 0 if eng_adv_elect == .

save "english_sci.dta", replace

use "all_stdnt_nb.dta", clear
merge 1:m sch_ep5 using "english_sci.dta" //39 obs
drop _merge

//******* 加深加廣僅開英文的學校 *******//
bysort sch_ep5: egen snd_for_lang_sch = total(snd_for_lang)
bysort sch_ep5: egen eng_adv_elect_sch = total(eng_adv_elect)

tab sch_ep5 if snd_for_lang_sch == 0 & eng_adv_elect_sch > 0

//******* 英文和第二外語皆開的學校 *******//
tab sch_ep5 if snd_for_lang_sch > 0 & eng_adv_elect_sch > 0
tab sch_ep5 if snd_for_lang_sch == 0 & eng_adv_elect_sch == 0

drop snd_for_lang_sch eng_adv_elect_sch

//******* 完整修滿英文加深加廣比例的各校學生人數 *******//
gen snd_for_lang_cr = cr_ep5 if ustrregexm(fld_ep4, "第二外國語文") == 1
replace snd_for_lang_cr = 0 if snd_for_lang_cr == .

gen eng_adv_elect_cr = cr_ep5 if ustrregexm(subj_ep4, "英語聽講|英文閱讀與寫作|英文作文") == 1
replace eng_adv_elect_cr = 0 if eng_adv_elect_cr == .

bysort id_nat_ncnu_ep5: egen lang_elect_cr = total(cr_ep5)
bysort id_nat_ncnu_ep5: egen snd_for_lang_cr_stdnt = total(snd_for_lang_cr)
bysort id_nat_ncnu_ep5: egen eng_adv_elect_cr_stdnt = total(eng_adv_elect_cr)

//create a dummy for fully taking 6-credit courses for English advanced electives and second foreign languages
gen full = 1 if lang_elect_cr >= 6
replace full = 0 if full == .

keep sch_ep5 id_nat_ncnu_ep5 sci_stdnt_nb full lang_elect_cr snd_for_lang_cr_stdnt eng_adv_elect_cr_stdnt

duplicates drop

bysort sch_ep5: egen full_sch = total(full)
bysort sch_ep5: egen eng_adv_elect_cr_stdnt_avg = mean(eng_adv_elect_cr_stdnt) 
bysort sch_ep5: egen snd_for_lang_cr_stdnt_avg = mean(snd_for_lang_cr_stdnt) 

drop full snd_for_lang_cr_stdnt eng_adv_elect_cr_stdnt lang_elect_cr id_nat_ncnu_ep5

duplicates drop

save "result_2\完整修滿英文加深加廣比例的各校學生人數及占比_0902_pre_sci.dta", replace

//************************//
use "english_sci.dta", clear

drop snd_for_lang eng_adv_elect

gen snd_for_lang = cr_ep5 if ustrregexm(fld_ep4, "第二外國語文") == 1
replace snd_for_lang = 0 if snd_for_lang == .

gen eng_listen = cr_ep5 if ustrregexm(subj_ep4, "英語聽講") == 1
replace eng_listen = 0 if eng_listen == .

gen eng_reading = cr_ep5 if ustrregexm(subj_ep4, "英文閱讀與寫作") == 1
replace eng_reading = 0 if eng_reading == .

gen eng_essay = cr_ep5 if ustrregexm(subj_ep4, "英文作文") == 1
replace eng_essay = 0 if eng_essay == .

save "english_detail_sci.dta", replace

use "all_stdnt_nb.dta", clear
merge 1:m sch_ep5 using "english_detail_sci.dta" //39 obs
drop _merge

//以學校和學生為單位計算開課及修課學分數
bysort id_nat_ncnu_ep5: egen snd_for_lang_stdnt = total(snd_for_lang)
bysort sch_ep5: egen snd_for_lang_sch = max(snd_for_lang_stdnt)

bysort id_nat_ncnu_ep5: egen eng_listen_stdnt = total(eng_listen)
bysort sch_ep5: egen eng_listen_sch = max(eng_listen_stdnt)

bysort id_nat_ncnu_ep5: egen eng_reading_stdnt = total(eng_reading)
bysort sch_ep5: egen eng_reading_sch = max(eng_reading_stdnt)

bysort id_nat_ncnu_ep5: egen eng_essay_stdnt = total(eng_essay)
bysort sch_ep5: egen eng_essay_sch = max(eng_essay_stdnt)

//******* 英文加深加廣各校開課組合 *******//
preserve
keep sch_ep5 snd_for_lang_sch eng_listen_sch eng_reading_sch eng_essay_sch
duplicates drop
save "result_2\engs_sch_0902_pre_sci.dta", replace
restore

//僅保留以學生為單位的數據
keep sch_ep5 id_nat_ncnu_ep5 snd_for_lang_stdnt eng_listen_stdnt eng_reading_stdnt eng_essay_stdnt sci_stdnt_nb

duplicates drop

//******* 選修二外比例 *******//
preserve
gen snd_for_lang_enroll = 1 if snd_for_lang_stdnt > 0
replace snd_for_lang_enroll = 0 if snd_for_lang_enroll == .

bysort sch_ep5: egen snd_for_lang_enroll_sch = total(snd_for_lang_enroll)
keep sch_ep5 sci_stdnt_nb snd_for_lang_enroll_sch
duplicates drop 

save "result_2\加深加廣修過二外各校學生人數_0902_pre_sci.dta", replace
restore

//******* 英文加深加廣學生修課組合 *******//
gen eng_adv_elect = eng_listen_stdnt + eng_reading_stdnt + eng_essay_stdnt
tab eng_adv_elect snd_for_lang_stdnt

gen engs_tot = eng_adv_elect + snd_for_lang_stdnt

gen not_pass = 1 if engs_tot < 6
replace not_pass = 0 if not_pass == .

gen too_much = 1 if engs_tot > 6
replace too_much = 0 if too_much == .

tab eng_adv_elect snd_for_lang_stdnt if not_pass == 0 & too_much == 0 & engs_tot == 6

gen six_eng = 1 if eng_adv_elect == 6 & engs_tot == 6
replace six_eng = 0 if six_eng == .

gen four_eng_two_s = 1 if eng_adv_elect == 4 & snd_for_lang_stdnt == 2 & engs_tot == 6
replace four_eng_two_s = 0 if four_eng_two_s == .

gen two_eng_four_s = 1 if eng_adv_elect == 2 & snd_for_lang_stdnt == 4 & engs_tot == 6
replace two_eng_four_s = 0 if two_eng_four_s == .

bysort sch_ep5: egen not_pass_sch = total(not_pass)
bysort sch_ep5: egen too_much_sch = total(too_much)
bysort sch_ep5: egen six_eng_sch = total(six_eng)
bysort sch_ep5: egen four_eng_two_s_sch = total(four_eng_two_s)
bysort sch_ep5: egen two_eng_four_s_sch = total(two_eng_four_s)

keep sch_ep5 sci_stdnt_nb not_pass_sch too_much_sch six_eng_sch four_eng_two_s_sch two_eng_four_s_sch
duplicates drop

save "result_2\英文加深加廣組合各校學生人數及占比_0902_pre_sci.dta", replace
