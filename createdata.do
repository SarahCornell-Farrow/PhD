**SET WORKING DIRECTORY**
clear
cd "\\uofa\users$\users8\a1610328\SARAH\StudentData"
**the working directory should be the folder where the ACARA csv data is saved**

**IMPORT DATA**
import delimited student_deidentified_2013.csv, case(preserve)
gen year=0
tempfile student2013
save `student2013'
clear
import delimited student_deidentified_2014.csv, case(preserve)
gen year=1
append using `student2013'
label data "student-level NAPLAN data"

**RENAMING AND LABELLING VARIABLES**
label variable year "=1 if 2014 dataset"
rename RANDOM_SCHOOL_ID school
label variable school "random schoolid"
rename RANDOM_STUDENT_ID student
label variable student "random studentid"
rename AGE age
label variable age "age at time of test to 1 decimal place"
rename INDIGENOUS_STATUS indig
label variable indig "=1 if aboriginal or torres strait islander origin"
rename MOTHER_SCHOOL_EDUCATION mumschool
label variable mumschool "1=year9 2=year10 3=year11 4=year12 (or equivalent)"
replace mumschool=. if mumschool==0
rename MOTHER_NON_SCHOOL_EDUCATION mumhighed
label variable mumhighed "5=certificate I to IV or trade 6=advanced diploma or diploma 7=bachelor 8=none"
replace mumhighed=. if mumhighed==0
rename MOTHER_OCCUP_GROUP mumoccup
label variable mumoccup "1=senior management 2=other business manager 3=trade clerk sales and service 4=machine operator 8=not in paid work"
replace mumoccup=. if mumoccup==9
rename FATHER_SCHOOL_EDUCATION dadschool
label variable dadschool "1=year9 2=year10 3=year11 4=year12 (or equivalent)"
replace dadschool=. if dadschool==0
rename FATHER_NON_SCHOOL_EDUCATION dadhighed
label variable dadhighed "5=certificate I to IV or trade 6=advanced diploma or diploma 7=bachelor 8=none"
replace dadhighed=. if dadhighed==0
rename FATHER_OCCUP_GROUP dadoccup
label variable dadoccup "1=senior management 2=other business manager 3=trade clerk sales and service 4=machine operator 8=not in paid work"
replace dadoccup=. if dadoccup==9
rename TEST_PARTICIPATION_CA part_calc
label variable part_calc "p=present a=absent e=exempt w=withdrawn s=sanctioned abandonment"
rename TEST_PARTICIPATION_NC part_n
label variable part_n "p=present a=absent e=exempt w=withdrawn s=sanctioned abandonment"
rename TEST_PARTICIPATION_R part_r
label variable part_r "p=present a=absent e=exempt w=withdrawn s=sanctioned abandonment"
rename TEST_PARTICIPATION_LC part_l
label variable part_l "p=present a=absent e=exempt w=withdrawn s=sanctioned abandonment"
rename TEST_PARTICIPATION_W part_w
label variable part_w "p=present a=absent e=exempt w=withdrawn s=sanctioned abandonment"
rename NUMERACY_ITEMS_CA numitemscalc
label variable numitemscalc "numeracy items calculator allowed"
rename NUMERACY_ITEMS_NC numitems
label variable numitems "numeracy items non-calculator"
rename READING_ITEMS readitems
label variable readitems "reading items"
rename LC_SPELLING_ITEMS spellitems
label variable spellitems "language conventions spelling items"
rename LC_G_P_ITEMS gitems
label variable gitems "language conventions grammar and punctuation items"
rename WRITING_ITEMS writems
label variable writems "writing items"
rename WLE_R readscore
label variable readscore "current reading score"
rename WLE_W writescore
label variable writescore "current writing score"
rename WLE_S spellscore
label variable spellscore "current spelling score"
rename WLE_G gramscore
label variable gramscore "current grammar and punctuation score"
rename WLE_N mathscore
label variable mathscore "current numeracy score"
rename SAME_SCHOOL_FLAG sameschool
label variable sameschool "same school flag"
rename prev_WLE_R readprev
label variable readprev "previous reading score"
rename prev_WLE_W writeprev
label variable writeprev "previous writing score"
rename prev_WLE_S spellprev
label variable spellprev "previous spelling score"
rename prev_WLE_G gramprev
label variable gramprev "previous grammar and punctuation score"
rename prev_WLE_N mathprev
label variable mathprev "previous numeracy score"

**GENDER DUMMY**
gen girl = 0
replace girl = 1 if SEX==2
label variable girl "=1 if girl"
drop SEX

**SECTOR DUMMIES**
gen pub = 0
replace pub = 1 if SECTOR=="G"
gen priv = 0
replace priv = 1 if SECTOR=="N"
label variable pub "=1 if government school"
label variable priv "=1 if non-government school"
drop SECTOR

**LOCATION DUMMIES**
gen met = 0
replace met = 1 if GEOLOCATION==1
label variable met "=1 if metropolitan location"
gen provincial = 0
replace provincial = 1 if GEOLOCATION==2
label variable provincial "=1 if provincial location"
gen remote = 0
replace remote = 1 if GEOLOCATION==3
label variable remote "=1 if remote or very remote location"
drop GEOLOCATION

**LBOTE DUMMY**
gen lbote = 0
replace lbote = 1 if LBOTE_STATUS=="Y"
replace lbote=. if LBOTE_STATUS=="9"
label variable lbote "=1 if language background other than english"
drop LBOTE_STATUS

**STATE DUMMIES**
gen SA = 0
replace SA = 1 if TAA=="SA"
label variable SA "=1 if South Australia"
gen NSW = 0
replace NSW = 1 if TAA=="NSW"
label variable NSW "=1 if New South Wales"
gen TAS = 0
replace TAS = 1 if TAA=="TAS"
label variable TAS "=1 if Tasmania"
gen VIC = 0
replace VIC = 1 if TAA=="VIC"
label variable VIC "=1 if Victoria"
gen QLD = 0
replace QLD = 1 if TAA=="QLD"
label variable QLD "=1 if Queensland"
gen WA = 0
replace WA = 1 if TAA=="WA"
label variable WA "=1 if Western Australia"
gen ACT = 0
replace ACT = 1 if TAA=="ACT"
label variable ACT "=1 if Australian Capital Territory"
gen NT = 0
replace NT = 1 if TAA=="NT"
label variable NT "=1 if Northern Territory"
drop TAA

**GRADE VARIABLE**
gen grade = 3
replace grade = 5 if YEAR_LEVEL=="Y5"
replace grade = 7 if YEAR_LEVEL=="Y7"
replace grade = 9 if YEAR_LEVEL=="Y9"
drop YEAR_LEVEL
label variable grade "grade of student in current year"

**PREVIOUS GRADE VARIABLE**
gen prevgrade=.
label variable prevgrade "grade of student in previous year"
replace prevgrade = 3 if grade==5
replace prevgrade = 5 if grade==7
replace prevgrade = 7 if grade==9

**SIMPLIFY IDS**
egen schoolid=group(school)
label variable schoolid "random school id"
drop school
replace schoolid=. if schoolid==1
egen studentid=group(schoolid year grade student)
label variable studentid "random student id"
drop student

**CREATE GAIN VARIABLES**
gen readgain=readscore-readprev
label variable readgain "current reading score minus previous score"
gen improveread=0
replace improveread=1 if readgain>0
replace improveread=. if readgain==.
label variable improveread "=1 if improved reading score in current period"
gen writegain=writescore-writeprev
label variable writegain "current writing score minus previous score"
gen improvewrite=0
replace improvewrite=1 if writegain>0
replace improvewrite=. if writegain==.
label variable improvewrite "=1 if improved writing score in current period"
gen spellgain=spellscore-spellprev
label variable spellgain "current spelling score minus previous score"
gen improvespell=0
replace improvespell=1 if spellgain>0
replace improvespell=. if spellgain==.
label variable improvespell "=1 if improved spelling score in current period"
gen gramgain=gramscore-gramprev
label variable gramgain "current grammar and punctuation score minus previous score"
gen improvegram=0
replace improvegram=1 if gramgain>0
replace improvegram=. if gramgain==.
label variable improvegram "=1 if improved grammar and punctuation score in current period"
gen mathgain=mathscore-mathprev
label variable mathgain "current numeracy score minus previous score"
gen improvemath=0
replace improvemath=1 if mathgain>0
replace improvemath=. if mathgain==.
label variable improvemath "=1 if improved numeracy score in current period"
gen improve=1
replace improve=. if readgain==. | writegain==. | spellgain==. | gramgain==. | mathgain==.
replace improve=0 if improveread==0 | improvewrite==0 | improvespell==0 | improvegram==0 | improvemath==0
label variable improve "=1 if improved in all domain areas"
gen fall=1
replace fall=. if readgain==. | writegain==. | spellgain==. | gramgain==. | mathgain==.
replace fall=0 if improveread==1 | improvewrite==1 | improvespell==1 | improvegram==1 | improvemath==1
label variable fall "=1 if scored lower in all domain areas"

**GENERATE COHORT VARIABLES**
egen cohort = group(schoolid year grade)
label variable cohort "cohort id for students in the same school, grade and year"
egen nstudent=count(studentid), by(cohort)
label variable nstudent "number of students in cohort"
egen meanreadscore=mean(readscore), by(cohort)
label variable meanreadscore "average cohort reading score"
egen meanwritescore=mean(writescore), by(cohort)
label variable meanwritescore "average cohort writing score"
egen meanspellscore=mean(spellscore), by(cohort)
label variable meanspellscore "average cohort spelling score"
egen meangramscore=mean(gramscore), by(cohort)
label variable meangramscore "average cohort grammar and punctuation score"
egen meanmathscore=mean(mathscore), by(cohort)
label variable meanmathscore "average cohort numeracy score"
egen meanreadprev=mean(readprev) if sameschool==1, by(cohort)
label variable meanreadprev "average cohort reading score in previous period if same school=1"
egen meanwriteprev=mean(writeprev) if sameschool==1, by(cohort)
label variable meanwriteprev "average cohort writing score in previous period if same school=1"
egen meanspellprev=mean(spellprev) if sameschool==1, by(cohort)
label variable meanspellprev "average cohort spelling score in previous period if same school=1"
egen meangramprev=mean(gramprev) if sameschool==1, by(cohort)
label variable meangramprev "average cohort grammar and punctuation score in previous period if same school=1"
egen meanmathprev=mean(mathprev) if sameschool==1, by(cohort)
label variable meanmathprev "average cohort numeracy score in previous period if same school=1"

**CREATE TEST DATE**
gen month=5
gen day=15
gen testyear=2013
gen testdate=mdy(month,day,testyear) if year==0
replace day=14
replace testyear=2014
replace testdate=mdy(month,day,testyear) if year==1
drop month
drop day
drop testyear
format testdate %d
label variable testdate "2013 tests covered 14-16 May, 2014 tests covered 13-15 May"

**CREATE BIRTH DATE**
gen agedays=age*365.4
gen birthday=testdate-agedays
format birthday %d
drop agedays
label variable birthday "birthdate calculated backwards from test date nb precision on age only to 1dp"

**CREATE BANDS**
gen mathband=6
label variable mathband "math band student situated in"
replace mathband=5 if mathscore<475 & grade==3 & year==1
replace mathband=4 if mathscore<417 & grade==3 & year==1
replace mathband=3 if mathscore<369 & grade==3 & year==1
replace mathband=2 if mathscore<317 & grade==3 & year==1
replace mathband=1 if mathscore<252 & grade==3 & year==1
replace mathband=8 if grade==5 & year==1
replace mathband=7 if mathscore<572 & grade==5 & year==1
replace mathband=6 if mathscore<529 & grade==5 & year==1
replace mathband=5 if mathscore<471 & grade==5 & year==1
replace mathband=4 if mathscore<424 & grade==5 & year==1
replace mathband=7 if mathscore<371 & grade==5 & year==1
replace mathband=9 if grade==7 & year==1
replace mathband=8 if mathscore<632 & grade==7 & year==1
replace mathband=7 if mathscore<580 & grade==7 & year==1
replace mathband=6 if mathscore<529 & grade==7 & year==1
replace mathband=5 if mathscore<476 & grade==7 & year==1
replace mathband=4 if mathscore<424 & grade==7 & year==1
replace mathband=10 if grade==9 & year==2014
replace mathband=9 if mathscore<682 & grade==9 & year==1
replace mathband=8 if mathscore<631 & grade==9 & year==1
replace mathband=7 if mathscore<578 & grade==9 & year==1
replace mathband=6 if mathscore<527 & grade==9 & year==1
replace mathband=5 if mathscore<473 & grade==9 & year==1
replace mathband=5 if mathscore<475 & grade==3 & year==0
replace mathband=4 if mathscore<417 & grade==3 & year==0
replace mathband=3 if mathscore<366 & grade==3 & year==0
replace mathband=2 if mathscore<314 & grade==3 & year==0
replace mathband=1 if mathscore<264 & grade==3 & year==0
replace mathband=8 if grade==5 & year==0
replace mathband=7 if mathscore<571 & grade==5 & year==0
replace mathband=6 if mathscore<529 & grade==5 & year==0
replace mathband=5 if mathscore<475 & grade==5 & year==0
replace mathband=4 if mathscore<422 & grade==5 & year==0
replace mathband=7 if mathscore<371 & grade==5 & year==0
replace mathband=9 if grade==7 & year==0
replace mathband=8 if mathscore<631 & grade==7 & year==0
replace mathband=7 if mathscore<578 & grade==7 & year==0
replace mathband=6 if mathscore<526 & grade==7 & year==0
replace mathband=5 if mathscore<477 & grade==7 & year==0
replace mathband=4 if mathscore<423 & grade==7 & year==0
replace mathband=10 if grade==9 & year==0
replace mathband=9 if mathscore<683 & grade==9 & year==0
replace mathband=8 if mathscore<632 & grade==9 & year==0
replace mathband=7 if mathscore<580 & grade==9 & year==0
replace mathband=6 if mathscore<526 & grade==9 & year==0
replace mathband=5 if mathscore<477 & grade==9 & year==0

gen readband=6
label variable readband "read band student situated in"
replace readband=5 if readscore<467 & grade==3 & year==1
replace readband=4 if readscore<420 & grade==3 & year==1
replace readband=3 if readscore<365 & grade==3 & year==1
replace readband=2 if readscore<319 & grade==3 & year==1
replace readband=1 if readscore<269 & grade==3 & year==1
replace readband=8 if grade==5 & year==1
replace readband=7 if readscore<577 & grade==5 & year==1
replace readband=6 if readscore<528 & grade==5 & year==1
replace readband=5 if readscore<475 & grade==5 & year==1
replace readband=4 if readscore<424 & grade==5 & year==1
replace readband=7 if readscore<369 & grade==5 & year==1
replace readband=9 if grade==7 & year==1
replace readband=8 if readscore<631 & grade==7 & year==1
replace readband=7 if readscore<579 & grade==7 & year==1
replace readband=6 if readscore<526 & grade==7 & year==1
replace readband=5 if readscore<473 & grade==7 & year==1
replace readband=4 if readscore<421 & grade==7 & year==1
replace readband=10 if grade==9 & year==1
replace readband=9 if readscore<684 & grade==9 & year==1
replace readband=8 if readscore<627 & grade==9 & year==1
replace readband=7 if readscore<576 & grade==9 & year==1
replace readband=6 if readscore<529 & grade==9 & year==1
replace readband=5 if readscore<478 & grade==9 & year==1
replace readband=5 if readscore<469 & grade==3 & year==0
replace readband=4 if readscore<424 & grade==3 & year==0
replace readband=3 if readscore<369 & grade==3 & year==0
replace readband=2 if readscore<322 & grade==3 & year==0
replace readband=1 if readscore<266 & grade==3 & year==0
replace readband=8 if grade==5 & year==0
replace readband=7 if readscore<574 & grade==5 & year==0
replace readband=6 if readscore<523 & grade==5 & year==0
replace readband=5 if readscore<471 & grade==5 & year==0
replace readband=4 if readscore<419 & grade==5 & year==0
replace readband=7 if readscore<368 & grade==5 & year==0
replace readband=9 if grade==7 & year==0
replace readband=8 if readscore<627 & grade==7 & year==0
replace readband=7 if readscore<575 & grade==7 & year==0
replace readband=6 if readscore<523 & grade==7 & year==0
replace readband=5 if readscore<477 & grade==7 & year==0
replace readband=4 if readscore<419 & grade==7 & year==0
replace readband=10 if grade==9 & year==0
replace readband=9 if readscore<686 & grade==9 & year==0
replace readband=8 if readscore<630 & grade==9 & year==0
replace readband=7 if readscore<580 & grade==9 & year==0
replace readband=6 if readscore<528 & grade==9 & year==0
replace readband=5 if readscore<478 & grade==9 & year==0

gen minreadstandard=0
label variable minreadstandard "0 if above standard, 1 if at standard, 2 if below standard"
replace minreadstandard=1 if grade==3 & readband==2
replace minreadstandard=2 if grade==3 & readband==1
replace minreadstandard=1 if grade==5 & readband==4
replace minreadstandard=2 if grade==5 & readband==3
replace minreadstandard=1 if grade==7 & readband==5
replace minreadstandard=2 if grade==7 & readband==4
replace minreadstandard=1 if grade==9 & readband==6
replace minreadstandard=2 if grade==9 & readband==5

gen minmathstandard=0
label variable minmathstandard "0 if above standard, 1 if at standard, 2 if below standard"
replace minmathstandard=1 if grade==3 & mathband==2
replace minmathstandard=2 if grade==3 & mathband==1
replace minmathstandard=1 if grade==5 & mathband==4
replace minmathstandard=2 if grade==5 & mathband==3
replace minmathstandard=1 if grade==7 & mathband==5
replace minmathstandard=2 if grade==7 & mathband==4
replace minmathstandard=1 if grade==9 & mathband==6
replace minmathstandard=2 if grade==9 & mathband==5

**SORT AND ORDER**
sort schoolid year grade studentid
order schoolid pub priv studentid year grade cohort

**SAVE DATASET**
save studentNAPLAN, replace
