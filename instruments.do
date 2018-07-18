///////////////////////////////////////////////////////////////////////////////
//Instrument tests
//2018
///////////////////////////////////////////////////////////////////////////////

use "\\uofa\users$\users8\a1610328\SARAH\StudentData\studentNAPLANclean.dta", clear
cd "\\uofa\users$\users8\a1610328\SARAH\heckoprobit\p2estimations"

log using instrument, replace

gen instone = 0
replace instone=1 if mumoccup==3
gen instwo = 0
replace instwo=1 if mumoccup==4

probit priv i.instone i.instwo i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 /*
	*/ i.mumbach i.dadbach i.mumjob i.dadjob c.state i.year
oprobit minreadstandard i.instone i.instwo i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 /*
	*/ i.mumbach i.dadbach i.mumjob i.dadjob c.state i.year
oprobit minmathstandard i.instone i.instwo i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 /*
	*/ i.mumbach i.dadbach i.mumjob i.dadjob c.state i.year

ivregress 2sls minreadstandard i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 /*
	*/ i.mumbach i.dadbach i.mumjob i.dadjob c.state i.year (i.priv = i.instone i.instwo), first

/* durbin-wu-hausman test */
estat endogenous

/* test for overidentifying restrictions */
estat overid

/* test for weak instruments */
estat firststage, forcenonrobust

ivregress 2sls minmathstandard i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 /*
	*/ i.mumbach i.dadbach i.mumjob i.dadjob c.state i.year (i.priv = i.instone i.instwo), first

/* durbin-wu-hausman test */
estat endogenous

/* test for overidentifying restrictions */
estat overid

/* test for weak instruments */
estat firststage, forcenonrobust

log close
translate instrument.smcl instrument.pdf, replace
erase instrument.smcl

log using sargan, replace

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = rich work inst nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = rich work nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = inst work nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = inst rich nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = work rich inst), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = rich nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = work nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = inst nstudent), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = work inst), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = rich inst), vce(robust)
estat overid

ivregress 2sls minreadstandard age indig girl-NT mumyr12-dadjob (priv = rich work), vce(robust)
estat overid

log close
translate sargan.smcl sargan.pdf, replace
erase sargan.smcl
