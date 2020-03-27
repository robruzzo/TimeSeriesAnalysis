"
Modeling assets with Moving Average
"

require(quantmod)

#fetch data from the web for AAPL (Apple)
getSymbols("AAPL", src="yahoo")

#Show the adjusted close for Apple
Ad(AAPL)

#Plot the adjusted close for apple
plot(Ad(AAPL))

#Log Daily returns of AAPL stock for adj close price
aaplreturn=diff(log(Ad(AAPL)))

#Plot daily returns
plot(aaplreturn)

#Autocorrelation function, and get rid of na
acf(aaplreturn,na.action=na.omit)

#We set AR=0 and integrated component to 0 so the MA is one
aaplreturn.ma <- arima(aaplreturn,order=c(0,0,1))
aaplreturn.ma

#drop the first value because it is NA
aaplreturn.ma$res[-1]

#y=x-x' the residual series: if the model is good there is no serial correlation in y(t)
acf(aaplreturn.ma$res[-1])

"
If we see autocorrelation factors beyond the 0 position which break the
95% CL line, then this model is not sufficient to describe the stock
behavior.
"

-0.0300 +c(-1.96,1.96)*0.0178

