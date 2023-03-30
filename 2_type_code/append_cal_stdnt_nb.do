cd "D:\advanced_electives\data\part"

//******* 以預檢系統為主 *******//
//******* append 所有 108 首屆學生修課紀錄 *******//
use "ep5_1081_ep4_1081_gr3.dta", clear
append using "ep5_1082_ep4_1082_gr3.dta"
append using "ep5_1091_ep4_1091_gr3.dta", force
append using "ep5_1092_ep4_1092_gr3.dta", force
append using "ep5_1101_ep4_1101_gr3.dta", force
append using "ep5_1102_pre_ep4_1102_gr3.dta", force

cd "D:\advanced_electives\data\"
save "ep5_ep4_gr3.dta"

//******* 只保留學術群/學術學程 *******//
keep if ustrpos(grp_ep4, "11") == 1
save "ep5_ep4_gr3_aca.dta", replace

/*
gen sci = 1 if crstyp_ep4 == "3_選修-加深加廣選修" & (fld_ep4 == "04_自然科學領域" | fld_ep4 == "4_自然科學領域") & ustrregexm(subj_ep4, "物理|化學|生物") == 1
replace sci = 0 if sci == .
gen soc = 1 if crstyp_ep4 == "3_選修-加深加廣選修" & (fld_ep4 == "03_社會領域" | fld_ep4 == "3_社會領域") & ustrregexm(subj_ep4, "探究與實作") == 1
replace soc = 0 if soc == .

bysort id_nat_ncnu_ep5: egen sci_stdnt = mean(sci)
bysort id_nat_ncnu_ep5: egen soc_stdnt = mean(soc)

gen stdnt_attr = "無法歸類_都不修" if sci_stdnt == 0 & soc_stdnt == 0 
replace stdnt_attr = "自然組" if sci_stdnt > 0 & soc_stdnt == 0 
replace stdnt_attr = "社會組" if soc_stdnt > 0 & sci_stdnt == 0
replace stdnt_attr = "無法歸類_都修" if soc_stdnt > 0 & sci_stdnt > 0

save "aca\ep5_total_socsci_gr3_pre.dta", replace


use "aca\ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "自然組"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen sci_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 sci_stdnt_nb
save "aca\sci_stdnt_nb", replace

use "aca\ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "社會組"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen soc_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 soc_stdnt_nb
save "aca\soc_stdnt_nb", replace

use "aca\ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "無法歸類_都修"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen both_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 both_stdnt_nb
save "aca\both_stdnt_nb", replace

use "aca\ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "無法歸類_都不修"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen none_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 none_stdnt_nb
save "aca\none_stdnt_nb", replace

use "aca\sci_stdnt_nb.dta", clear
merge 1:1 sch_ep5 using "aca\soc_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "aca\both_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "aca\none_stdnt_nb"
drop _merge

recode sci_stdnt_nb soc_stdnt_nb both_stdnt_nb none_stdnt_nb (. = 0)
gen stdnt_nb = sci_stdnt_nb + soc_stdnt_nb + both_stdnt_nb + none_stdnt_nb
save "aca\all_stdnt_nb", replace
*/

//******* 只保留加深加廣選修 *******//
use "ep5_ep4_gr3.dta", clear
keep if crstyp_ep4 == "3_選修-加深加廣選修"

gen sci = 1 if (fld_ep4 == "04_自然科學領域" | fld_ep4 == "4_自然科學領域") & ustrregexm(subj_ep4, "物理|化學|生物") == 1
replace sci = 0 if sci == .
gen soc = 1 if (fld_ep4 == "03_社會領域" | fld_ep4 == "3_社會領域") & ustrregexm(subj_ep4, "探究與實作") == 1
replace soc = 0 if soc == .

bysort id_nat_ncnu_ep5: egen sci_stdnt = mean(sci)
bysort id_nat_ncnu_ep5: egen soc_stdnt = mean(soc)

gen stdnt_attr = "無法歸類_都不修" if sci_stdnt == 0 & soc_stdnt == 0 
replace stdnt_attr = "自然組" if sci_stdnt > 0 & soc_stdnt == 0 
replace stdnt_attr = "社會組" if soc_stdnt > 0 & sci_stdnt == 0
replace stdnt_attr = "無法歸類_都修" if soc_stdnt > 0 & sci_stdnt > 0

save "ep5_total_socsci_gr3_pre.dta", replace

use "ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "自然組"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen sci_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 sci_stdnt_nb
save "sci_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "社會組"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen soc_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 soc_stdnt_nb
save "soc_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "無法歸類_都修"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen both_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 both_stdnt_nb
save "both_stdnt_nb", replace

use "ep5_total_socsci_gr3_pre.dta", clear
keep if stdnt_attr == "無法歸類_都不修"
duplicates drop sch_ep5 id_nat_ncnu_ep5, force
bysort sch_ep5: gen none_stdnt_nb = _N
duplicates drop sch_ep5, force
keep sch_ep5 none_stdnt_nb
save "none_stdnt_nb", replace

use "sci_stdnt_nb.dta", clear
merge 1:1 sch_ep5 using "soc_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "both_stdnt_nb"
drop _merge
merge 1:1 sch_ep5 using "none_stdnt_nb"
drop _merge

recode sci_stdnt_nb soc_stdnt_nb both_stdnt_nb none_stdnt_nb (. = 0)
gen stdnt_nb = sci_stdnt_nb + soc_stdnt_nb + both_stdnt_nb + none_stdnt_nb

drop if sch_ep5 == "171405_私立光隆家商"

save "2_type\all_stdnt_nb", replace

erase "bio_med_stdnt_nb.dta" 
erase "sci_eng_stdnt_nb.dta" 
erase "soc_stdnt_nb.dta" 
erase "both_stdnt_nb.dta" 
erase "none_stdnt_nb.dta"