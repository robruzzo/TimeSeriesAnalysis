"
Modeling assets with Random Walk
"

require(quantmod)

#fetch data from the web for AAPL (Apple)
getSymbols("AAPL", src="yahoo")

#Show the adjusted close for Apple
Ad(AAPL)

#Plot the adjusted close for apple
plot(Ad(AAPL))

#Plot the difference function of AAPL
plot(diff(Ad(AAPL)),na.action=na.omit)

#Autocorrelation function, and get rid of na
acf(diff(Ad(AAPL)),na.action=na.omit)

"Since the autocorrelation is not like the white noise, then this model
is not good for modeling the asset values. There are several peaks above
and below the 95% CL lines, thus this is not a good method of modeling 
stocks. (Even if it looks pretty good for some stocks it will be way
worse for others) We simply are comparing the trend in the apple stock
to the x(t)=x(t-1)+W(t) model."