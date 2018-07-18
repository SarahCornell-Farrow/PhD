clear
use "\\uofa\users$\users8\a1610328\SARAH\StudentData\studentNAPLANclean.dta", clear
cd "\\uofa\users$\users8\a1610328\SARAH\heckoprobit\p2estimations"

gen instone = 0
replace instone=1 if mumoccup==3
gen instwo = 0
replace instwo=1 if mumoccup==4

/*choose variables*/
global xlist i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 /*
	*/ i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year
global instlist i.instone i.instwo
