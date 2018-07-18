log using predictions, replace

///////////////////////////////////////////////////////////////////////////////
//reading

run choosevars

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans

///////////////////////////////////////////////////////////////////////////////
//math

run choosevars

glm priv i.indig i.lbote i.provincial i.remote i.girl i.mumyr12 i.dadyr12 i.mumbach i.dadbach i.mumjob i.dadjob i.state i.year $instlist [pw=swgt] , ml family(binomial) link(probit) vce(robust)
predict zg, xb
gen pdf = normalden(zg)
gen cdf = normal(zg)
gen IMR = pdf/cdf
gen negpdf = normalden(-zg)
gen negcdf = 1-normal(zg)
gen negIMR = negpdf/negcdf
gen rhat = (priv*IMR)-1-((1-priv)*negIMR)
oprobit minmathstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans

///////////////////////////////////////////////////////////////////////////////

log close
translate predictions.smcl predictions.pdf, replace
erase predictions.smcl

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

log using prediction_errors, replace

///////////////////////////////////////////////////////////////////////////////
//reading 

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

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
oprobit minreadstandard priv rhat $xlist [pw = swgt] , vce(robust)
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end
bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_read

///////////////////////////////////////////////////////////////////////////////
//math

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
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==0 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==1 lbote==1 provincial==0 remote==1 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==0 lbote==1 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==1 lbote==0 provincial==0 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==1 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==0 lbote==0 provincial==1 remote==0 girl==0 mumyr12==1 dadyr12==1 mumbach==1 dadbach==1 mumjob==1 dadjob==1) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==1 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==1 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

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
margins, at(priv==0 indig==1 lbote==1 provincial==1 remote==0 girl==0 mumyr12==0 dadyr12==0 mumbach==0 dadbach==0 mumjob==0 dadjob==0) atmeans post

end

bootstrap _b, reps(100) seed(10101) nodots nowarn: cf_math

log close
translate prediction_errors.smcl prediction_errors.pdf, replace
erase prediction_errors.smcl
