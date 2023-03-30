cd "D:\advanced_electives\"

do "merge.do"

//******* 整體-自然組-社會組 *******//
cd "D:\advanced_electives\2_type_code"

do "append_cal_stdnt_nb.do"

//國文(無時間)
do "mandarin_total.do"
do "mandarin_sci.do"
do "mandarin_soc.do"

//國文(有時間)
do "mandarin_total_time.do"
do "mandarin_sci_time.do"
do "mandarin_soc_time.do"

//英文
do "eng_total.do"
do "eng_sci.do"
do "eng_soc.do"

//******* 自然組(理工)-自然組(生醫) *******//
cd "D:\advanced_electives\III-type_code"

do "append_cal_stdnt_nb_III.do"

//國文(無時間)
do "mandarin_sci_eng.do"
do "mandarin_bio_med.do"

//國文(有時間)
do "mandarin_sci_eng_time.do"
do "mandarin_bio_med_time.do"

//英文
do "eng_sci_eng.do"
do "eng_bio_med.do"