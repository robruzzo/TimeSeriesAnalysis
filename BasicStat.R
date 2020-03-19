#if not already installed you must use quantmod package
install.packages("quantmod")

require(quantmod)

#fetch data from the web for AAPL (Apple)
getSymbols("AAPL", src="yahoo")

#Show the adjusted close for Apple
Ad(AAPL)

#Plot the adjusted close for apple
plot(Ad(AAPL))

#Autocorrelation function, and get rid of na
acf(diff(Ad(AAPL)),na.action=na.omit)

#Statistics: Mean, variance, std dev
mean(Ad(AAPL))
var(Ad(AAPL))
sd(Ad(AAPL))

