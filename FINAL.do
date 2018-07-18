log using finalresults, replace

///////////////////////////////////////////////////////////////////////////////
//predicted outcomes
run choosevars

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb

///////////////////////////////////////////////////////////////////////////////
///Construct generalised residuals
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat

///////////////////////////////////////////////////////////////////////////////

oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
predict p1read, outcome(1)
predict p2read, outcome(2)
predict p3read, outcome(3)
summarize p1read p2read p3read
tabulate minreadstandard

oprobit minmathstandard priv rhat $xlist [pw = swgt] , vce(robust)
predict p1math, outcome(1)
predict p2math, outcome(2)
predict p3math, outcome(3)
summarize p1math p2math p3math
tabulate minmathstandard

///////////////////////////////////////////////////////////////////////////////
//bootstrap for reading estimates

run choosevars

cap program drop cf_read
program cf_read, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)

matrix `b' = e(b)
ereturn post `b'
end

bootstrap _b, reps(200) seed(10101) nodots nowarn: cf_read

///////////////////////////////////////////////////////////////////////////////
//bootstrap for math estimates

run choosevars

cap program drop cf_math
program cf_math, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minmathstandard priv rhat $xlist [pw = swgt] , vce(robust)

matrix `b' = e(b)
ereturn post `b'
end

bootstrap _b, reps(200) seed(10101) nodots nowarn: cf_math

log close
translate finalresults.smcl finalresults.pdf, replace
erase finalresults.smcl

///////////////////////////////////////////////////////////////////////////////
//MFX
cd "\\uofa\users$\users8\a1610328\SARAH\heckoprobit\p2estimations"
log using mfxse, replace

///////////////////////////////////////////////////////////////////////////////
//bootstraps for reading mfx

run choosevars

cap program drop mfx_read
program mfx_read, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, dydx(*) atmeans predict(outcome(1)) vce(unconditional) post

end

bootstrap _b, reps(200) seed(10101) nodots nowarn: mfx_read

run choosevars

cap program drop mfx_read
program mfx_read, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, dydx(*) atmeans predict(outcome(2)) vce(unconditional) post

end

bootstrap _b, reps(200) seed(10101) nodots nowarn: mfx_read

run choosevars

cap program drop mfx_read
program mfx_read, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, dydx(*) atmeans predict(outcome(3)) vce(unconditional) post

end

bootstrap _b, reps(200) seed(10101) nodots nowarn: mfx_read

///////////////////////////////////////////////////////////////////////////////
//bootstraps for numeracy mfx

run choosevars

cap program drop mfx_math
program mfx_math, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minmathstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, dydx(*) atmeans predict(outcome(1)) vce(unconditional) post

end

bootstrap _b, reps(200) seed(10101) nodots nowarn: mfx_math

run choosevars

cap program drop mfx_math
program mfx_math, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minmathstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, dydx(*) atmeans predict(outcome(2)) vce(unconditional) post

end

bootstrap _b, reps(200) seed(10101) nodots nowarn: mfx_math

run choosevars

cap program drop mfx_math
program mfx_math, eclass
tempname b V
capture drop zg rhat pdf cdf IMR negpdf negcdf negIMR

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
summarize rhat
oprobit minmathstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, dydx(*) atmeans predict(outcome(3)) vce(unconditional) post

end

bootstrap _b, reps(200) seed(10101) nodots nowarn: mfx_math

///////////////////////////////////////////////////////////////////////////////

log close
translate mfxse.smcl mfxse.pdf, replace
erase mfxse.smcl
