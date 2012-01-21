*This program is written for Homework 2 of Math Method 180.604
*Written by Hugh Boqun Wang
*Created Apr 19th, 2011
*Last edited Apr 20th, 2011
cd "Q:\616\2011 Spring\PS02_Portfolio-CRRA\WangB"
clear
set more off
*#delimit ;

*For Figure 1
set obs 500
*Define parameters
gen Phi=0.04
gen rfree=0.00
gen Sigma=0.2
gen ScriptR=rfree+Phi
gen Rfree=exp(rfree)
gen StigmaOptApprox=.
gen Rho=.
gen CapPhi=.

*Caculate and plot the Approximated portfolio choice
forvalues i=1/500 {
replace Rho=(`i'-1)*0.01 in `i'
replace StigmaOptApprox=Phi/(Rho*Sigma^2) in `i'
}

twoway line StigmaOptApprox Rho in 100/500,title("For parameter r=0.04 {&sigma}=0.2") mcolor(ebblue) ytitle("{&sigmaf}") xtitle("{&rho}") 
graph export f1.eps, replace
graph save f1 , asis replace

*For Figure 2
*Redefine parameters
clear
set more off
set obs 100
range CapPhi 0.8 1.7 1000
gen Stigma=.
gen StigmaOptExact=0
gen EuOptExact=-100000000
gen StigmaOptApprox=.
gen Rho=.
gen Sigma=0.2
gen Phi=0.04
gen Eu=.
gen EuRaw=.
gen Err=.

forvalues i=1/100 {
replace Rho=(`i')*0.05
	forvalues j=1/100 {
		replace Stigma=(`j')*0.0099
		replace EuRaw=-(1+(CapPhi-1)*Stigma)^(1-Rho)*(1/(sqrt(2*3.14)*CapPhi*Sigma))*exp((-(ln(CapPhi)-(Phi-Sigma^2/2))^2)/(2*Sigma^2))
		integ EuRaw CapPhi 
		replace Eu=r(integral) in `j'
		gen temp=r(integral)
		if temp>=EuOptExact in `i' {
		replace EuOptExact=temp in `i'
		replace StigmaOptExact=Stigma in `i' 
		}
		drop temp
		}
}

forvalues i=1/100 {
replace Rho=(`i')*0.05 in `i'
replace StigmaOptApprox=Phi/(Rho*Sigma^2) in `i'
}

replace Err=StigmaOptExact-StigmaOptApprox
twoway line Err Rho, title("For parameter r=0.04 {&sigma}=0.2") mcolor(ebblue) ytitle("Error") xtitle("{&rho}") 
graph export f2.eps, replace
graph save f2, asis replace


