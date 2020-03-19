#Required Packages
require(quantmod)

#fetch data from the web for AAPL (Apple)
getSymbols("AAPL", src="yahoo")

#Show the adjusted close for Apple
Ad(AAPL)

#Plot the adjusted close for apple
plot(Ad(AAPL))

#log daily returns of APPL stock (for adj closing prices)
aaplreturn=diff(log(Ad(AAPL)))

#plot the returns
plot(aaplreturn)

#autocorrelation function plot
acf(aaplreturn,na.action=na.omit)

#use autoregressive model to approximate the coefficients
aaplreturn.ar <- ar(aaplreturn,na.action=na.omit)
#the order of AR(p) model 
aaplreturn.ar$order
#The coefficients: it will give as many as the order
aaplreturn.ar$ar
#calculate the variance for the coefficents, for error calculation
#The diagonal values will be the variance for the coefficients, they 
#will all be the same
aaplreturn.ar$asy.var


"we can calculate standard error and confidence intervals for the
parameters. sqrt() to end up with the standard error. We can construct
the 95% confidence intervals for each parameter. the value of 1.96
is based on the fact that 95% of the area of a distribution is within 
1.96 standard deviations of the mean"

for(x in 1:aaplreturn.ar$order) cat(aaplreturn.ar$ar[x],print(aaplreturn.ar$ar[x]+c(-1.96,1.96)*sqrt(aaplreturn.ar$asy.var[1][1])),"\n")

"If any of the parameters is outside of the confidence interval the 
model isnt really expalining the variation correctly and a different
model should be used. Also looking at the autocorrelation function 
graph we can see that there are several peaks that rise above or go
below the 95% CL lines. This in itself would suggest that there may 
be a better model to use because, although they are small they are 
unexplained variation."