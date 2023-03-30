cd "D:\advanced_electives\data\part"

//******* modify 1081 for merge *******//
use "ep4_1081.dta", clear
rename crs_cd_ep4 crs_cd

duplicates drop

duplicates tag crs_cd, gen(crs_cd_rep)
tab crs_cd_rep
sort crs_cd_rep crs_cd

drop if crs_cd_rep == 1 & crstyp_ep4 == "8_團體活動時間" & cr_tr_ep4 != "0"
//去除有學分的團體活動時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 == "V_技術型高中(技高)" & crsattr_ep4 != "D_充實(增廣)、補強性教學[全學期、授予學分]" & cr_tr_ep4 != "0" //去除技高學分數 > 0 之彈性學習時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 != "V_技術型高中(技高)" & cr_tr_ep4 != "0" //去除非技高學分數 > 0 之彈性學習時間

duplicates report crs_cd
drop crs_cd_rep

save "ep4_1081_gr3.dta", replace

//******* modify 1082 for merge *******//
use "ep4_1082.dta", clear
rename crs_cd_ep4 crs_cd

duplicates drop

duplicates tag crs_cd, gen(crs_cd_rep)
tab crs_cd_rep
sort crs_cd_rep crs_cd

drop if crs_cd_rep == 1 & crstyp_ep4 == "8_團體活動時間" & cr_tr_ep4 != "0"
//去除有學分的團體活動時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 == "V_技術型高中(技高)" & crsattr_ep4 != "D_充實(增廣)、補強性教學[全學期、授予學分]" & cr_tr_ep4 != "0" //去除技高學分數 > 0 之彈性學習時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 != "V_技術型高中(技高)" & cr_tr_ep4 != "0" //去除非技高學分數 > 0 之彈性學習時間

duplicates report crs_cd
drop crs_cd_rep

save "ep4_1082_gr3.dta", replace

//******* modify 1091 for merge  *******//
use "ep4_1091.dta", clear
rename crs_cd_ep4 crs_cd

duplicates drop

duplicates tag crs_cd, gen(crs_cd_rep)
tab crs_cd_rep
sort crs_cd_rep crs_cd

drop if crs_cd_rep == 1 & crstyp_ep4 == "8_團體活動時間" & cr_tr_ep4 != "0"
//去除有學分的團體活動時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 == "V_技術型高中(技高)" & crsattr_ep4 != "D_充實(增廣)、補強性教學[全學期、授予學分]" & cr_tr_ep4 != "0" //去除技高學分數 > 0 之彈性學習時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 != "V_技術型高中(技高)" & cr_tr_ep4 != "0" //去除非技高學分數 > 0 之彈性學習時間

duplicates report crs_cd
drop crs_cd_rep

keep if ayr_appl_ep4 == "2019"
save "ep4_1091_gr3.dta", replace

//******* modify 1092 for merge  *******//
use "ep4_1092.dta", clear
rename crs_cd_ep4 crs_cd

duplicates drop

duplicates tag crs_cd, gen(crs_cd_rep)
tab crs_cd_rep
sort crs_cd_rep crs_cd

drop if crs_cd_rep == 1 & crstyp_ep4 == "8_團體活動時間" & cr_tr_ep4 != "0"
//去除有學分的團體活動時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 == "V_技術型高中(技高)" & crsattr_ep4 != "D_充實(增廣)、補強性教學[全學期、授予學分]" & cr_tr_ep4 != "0" //去除技高學分數 > 0 之彈性學習時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 != "V_技術型高中(技高)" & cr_tr_ep4 != "0" //去除非技高學分數 > 0 之彈性學習時間

duplicates report crs_cd
drop crs_cd_rep

keep if ayr_appl_ep4 == "2019"
save "ep4_1092_gr3.dta", replace

//******* modify 1101 for merge  *******//
use "ep4_1101.dta", clear
rename crs_cd_ep4 crs_cd

duplicates drop

duplicates tag crs_cd, gen(crs_cd_rep)
tab crs_cd_rep
sort crs_cd_rep crs_cd

drop if crs_cd_rep == 1 & crstyp_ep4 == "8_團體活動時間" & cr_tr_ep4 != "0"
//去除有學分的團體活動時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 == "V_技術型高中(技高)" & crsattr_ep4 != "D_充實(增廣)、補強性教學[全學期、授予學分]" & cr_tr_ep4 != "0" //去除技高學分數 > 0 之彈性學習時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 != "V_技術型高中(技高)" & cr_tr_ep4 != "0" //去除非技高學分數 > 0 之彈性學習時間

duplicates report crs_cd
drop crs_cd_rep

keep if ayr_appl_ep4 == "2019"
save "ep4_1101_gr3.dta", replace

//******* modify 1102 for merge  *******//
use "ep4_1102.dta", clear
rename crs_cd_ep4 crs_cd

duplicates drop

duplicates tag crs_cd, gen(crs_cd_rep)
tab crs_cd_rep
sort crs_cd_rep crs_cd

drop if crs_cd_rep == 1 & crstyp_ep4 == "8_團體活動時間" & cr_tr_ep4 != "0"
//去除有學分的團體活動時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 == "V_技術型高中(技高)" & crsattr_ep4 != "D_充實(增廣)、補強性教學[全學期、授予學分]" & cr_tr_ep4 != "0" //去除技高學分數 > 0 之彈性學習時間
drop if crs_cd_rep == 1 & crstyp_ep4 == "9_彈性學習時間" & pgtyp_ep4 != "V_技術型高中(技高)" & cr_tr_ep4 != "0" //去除非技高學分數 > 0 之彈性學習時間

duplicates report crs_cd
drop crs_cd_rep

keep if ayr_appl_ep4 == "2019"
save "ep4_1102_gr3.dta", replace

/*
//******* Alternative 班群 *******//

tab dep_ep4

//自然組
gen sci = 1 if ustrregexm(currtyp_ep4, "自|數|化|工|資|生|醫|電|農|技|衛") == 1
replace sci = 0 if sci == .

//社會組
gen soc = 1 if ustrregexm(currtyp_ep4, "文|法|商|社|財|管|政|語|藝|傳|哲") == 1
replace soc = 0 if soc == .

replace sci = 1 if dep_ep4 == "106_數理資優班" | dep_ep4 == "108_科學班" | dep_ep4 == "198_學術自然學程"
replace soc = 0 if dep_ep4 == "106_數理資優班" | dep_ep4 == "108_科學班" | dep_ep4 == "198_學術自然學程"

replace soc = 1 if dep_ep4 == "107_語文資優班" | dep_ep4 == "123_人文與社會科學資優班" | dep_ep4 == "197_學術社會學程"
replace sci = 0 if dep_ep4 == "107_語文資優班" | dep_ep4 == "123_人文與社會科學資優班" | dep_ep4 == "197_學術社會學程"

tab currtyp_ep4 if sci == 1 & soc == 1
replace sci = 0 if currtyp_ep4 == "C_文組修數乙" | currtyp_ep4 == "D_文組不修數乙"

tab currtyp_ep4 if sci == 1 & soc == 1 & ustrpos(dep_ep4, "1") == 1
tab currtyp_ep4 if sci == 0 & soc == 0 & ustrpos(dep_ep4, "1") == 1

//replace soc = 1 if ustrregexm(currtyp_ep4, "一類|第一") == 1
//replace soc = 1 if ustrregexm(currtyp_ep4, "二類|第二") == 1
//replace sci = 1 if ustrregexm(currtyp_ep4, "三類|第三") == 1
//replace sci = 1 if ustrregexm(currtyp_ep4, "四類|第四") == 1

replace sci = 1 if currtyp_ep4 == "B_理" | currtyp_ep4 == "B_理組"
replace sci = 1 if currtyp_ep4 == "B_科學學程"
replace sci = 1 if currtyp_ep4 == "F_基礎科學班群"
replace sci = 1 if currtyp_ep4 == "S_科學實驗班"
replace sci = 1 if currtyp_ep4 == "U_應用科學班"

tab currtyp_ep4 if sci == 0 & soc == 0 & ustrpos(dep_ep4, "1") == 1

preserve 
duplicates drop sch_cd_ep4 dep_ep4 currtyp_ep4, force
list sch_cd_ep4 dep_ep4 currtyp_ep4 if sci == 0 & soc == 0 & ustrpos(dep_ep4, "1") == 1
restore
*/

cd "D:\advanced_electives\data\part"

//******* merge 1081 開設課程 and 成績名冊 *******//
use "ep5_1081.dta", clear

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1081_gr3.dta" //43853 obs from using, not matched

drop if _merge == 2
drop _merge

save "ep5_1081_ep4_1081_gr3.dta", replace

//******* merge 1082 開設課程 and 成績名冊 *******//
use "ep5_1082.dta", clear

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1082_gr3.dta" //48226 obs from using, not matched

drop if _merge == 2
drop _merge

save "ep5_1082_ep4_1082_gr3.dta", replace

//******* merge 1091 開設課程 and 成績名冊 *******//
use "ep5_1091.dta", clear
keep if stgr_ep5 == "2"

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1091_gr3.dta" //52221 obs from using, not matched

drop if _merge == 2
drop _merge

save "ep5_1091_ep4_1091_gr3.dta", replace

//******* merge 1092 開設課程 and 成績名冊 *******//
use "ep5_1092.dta", clear
keep if stgr_ep5 == "2"

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1092_gr3.dta" //54799 obs from using, not matched

drop if _merge == 2
drop _merge

save "ep5_1092_ep4_1092_gr3.dta", replace

//******* merge 1101 開設課程 and 成績名冊 *******//
use "ep5_1101.dta", clear
keep if stgr_ep5 == "3"

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1101_gr3.dta" //60107 obs from using, not matched

drop if _merge == 2
drop _merge

save "ep5_1101_ep4_1101_gr3.dta", replace

//******* merge 1102 開設課程 and 預檢系統 *******//
use "ep5_1102_pre.dta", clear
keep if stgr_ep5 == "3"

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1102_gr3.dta" 
//536 obs from master, not matched
//68139 obs from using, not matched

drop if _merge == 2
drop _merge

save "ep5_1102_pre_ep4_1102_gr3.dta", replace

/*
//******* merge 1102 開設課程 and 健診系統 *******//

//create school name list
use "ep5_1101.dta", clear
duplicates drop sch_ep5, force
keep sch_ep5
split sch_ep5, parse("_")
rename sch_ep51 sch_cd_ep5
rename sch_ep52 sch_nm_ep5
drop sch_nm_ep5
save "sch_nm_1101.dta", replace

use "ep5_1102_pre.dta", clear
duplicates drop sch_ep5, force
keep sch_ep5
split sch_ep5, parse("_")
rename sch_ep51 sch_cd_ep5
rename sch_ep52 sch_nm_ep5
drop sch_nm_ep5
save "sch_nm_1102_pre.dta", replace

use "sch_nm_1101.dta", clear
append using "sch_nm_1102_pre"
duplicates drop 
save "sch_nm.dta", replace

erase "sch_nm_1101.dta"
erase "sch_nm_1102_pre.dta"

use "ep5_1102_health_gr3.dta", clear
merge m:1 sch_cd_ep5 using "sch_nm.dta"
//82973 obs from master, not matched
//55 obs from using, not matched
drop _merge

keep if stgr_ep5 == "3"
keep if sctyp_ep5 == "學期成績" | sctyp_ep5 == "進修部學期成績"
//merge m:1 sch_cd_ep5 using "sch_stdnt_n_1102_health_gr3.dta"
//drop _merge

rename crs_cd_ep5 crs_cd
merge m:1 crs_cd using "ep4_1102_gr3.dta"
//1942 obs from master, not matched
//65232 obs from using, not matched

drop if _merge == 2
drop _merge

tab ayr_appl_ep5, missing
drop ayr_appl_ep5

save "ep5_1102_health_gr3_ep4_1102_gr3.dta", replace
*/
