cd "D:\advanced_electives\data"

//******* 只保留加深加廣選修 *******//
use "ep5_ep4_gr3_aca.dta", clear

/*
duplicates drop upl_ayr_ep5 upl_sem_ep5 id_nat_ncnu_ep5, force
bysort id_nat_ncnu_ep5: gen times = _N
keep if times == 6
duplicates drop id_nat_ncnu_ep5, force
keep id_nat_ncnu_ep5 times
save "id_times.dta", replace

keep if crstyp_ep4 == "3_選修-加深加廣選修"
merge m:1 id_nat_ncnu_ep5 using "id_times.dta"
drop if _merge == 1
drop if _merge == 2
drop _merge

duplicates drop sch_ep5 id_nat_ncnu_ep5, force
*/

gen bio_med = 1 if (fld_ep4 == "04_自然科學領域" | fld_ep4 == "4_自然科學領域") &  ustrregexm(subj_ep4, "生物") == 1
replace bio_med = 0 if bio_med == .
gen sci_eng = 1 if (fld_ep4 == "04_自然科學領域" | fld_ep4 == "4_自然科學領域") & ustrregexm(subj_ep4, "物理|化學") == 1 & ustrregexm(subj_ep4, "生物") == 0
replace sci_eng = 0 if sci_eng == .
gen soc = 1 if (fld_ep4 == "03_社會領域" | fld_ep4 == "3_社會領域") & ustrregexm(subj_ep4, "探究與實作") == 1
replace soc = 0 if soc == .

bysort id_nat_ncnu_ep5: egen bio_med_stdnt = mean(bio_med)
bysort id_nat_ncnu_ep5: egen sci_eng_stdnt = mean(sci_eng)
bysort id_nat_ncnu_ep5: egen soc_stdnt = mean(soc)

gen stdnt_attr = "無法歸類_都不修" if bio_med_stdnt == 0 & sci_eng_stdnt == 0 & soc_stdnt == 0
replace stdnt_attr = "自然組(生物)" if bio_med_stdnt > 0 & sci_eng_stdnt >= 0 & soc_stdnt == 0 
replace stdnt_attr = "自然組(無生物)" if bio_med_stdnt == 0 & sci_eng_stdnt > 0 & soc_stdnt == 0
replace stdnt_attr = "社會組" if soc_stdnt > 0 & sci_eng_stdnt == 0 & bio_med_stdnt == 0
replace stdnt_attr = "無法歸類_都修" if soc_stdnt > 0 & (sci_eng_stdnt > 0 |  bio_med_stdnt > 0)

save "ep5_total_socsci_gr3_pre_III.dta", replace

use "ep5_total_socsci_gr3_pre_III.dta", clear
keep if stdnt_attr == "自然組(生物)"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen bio_med_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 bio_med_stdnt_nb
save "bio_med_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre_III.dta", clear
keep if stdnt_attr == "自然組(無生物)"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen sci_eng_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 sci_eng_stdnt_nb
save "sci_eng_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre_III.dta", clear
keep if stdnt_attr == "社會組"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen soc_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 soc_stdnt_nb
save "soc_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre_III_new.dta", clear
keep if stdnt_attr == "無法歸類_都修"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen both_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 both_stdnt_nb
save "both_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre_III.dta", clear
keep if stdnt_attr == "無法歸類_都不修"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen none_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 none_stdnt_nb
save "none_stdnt_nb", replace

use "bio_med_stdnt_nb.dta", clear
merge 1:1 sch_ep5 using "sci_eng_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "soc_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "both_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "none_stdnt_nb"
drop _merge

recode bio_med_stdnt_nb sci_eng_stdnt_nb soc_stdnt_nb both_stdnt_nb none_stdnt_nb (. = 0)
gen stdnt_nb = bio_med_stdnt_nb + sci_eng_stdnt_nb + soc_stdnt_nb + both_stdnt_nb + none_stdnt_nb

drop if sch_ep5 == "171405_私立光隆家商"

save "III-type\all_stdnt_nb_III", replace

erase "bio_med_stdnt_nb.dta" 
erase "sci_eng_stdnt_nb.dta" 
erase "soc_stdnt_nb.dta" 
erase "both_stdnt_nb.dta" 
erase "none_stdnt_nb.dta"