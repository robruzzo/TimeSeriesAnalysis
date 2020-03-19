set.seed(2)

#first we generate 100 white noise values
w<-rnorm(2000,mean=0,sd=1)

#we create 100 items with value 0 for the x(t) time series
x<-rep(0,2000)

#random walk is x(t) = x(t+1)previous value +w (white noise)
for(t in 2:2000) x[t]<-x[t-1]+w[t]

#lets plot the random walk with lines ("l")
plot(x,type="l")

#autocorrelation plot Note: slowly decreasing = Non Stationarity
acf(x)

"Random walk is not a stationary process but we can make it stationary
by using a differencing transformation x-x(t-1)
Note: Autocorrelation at 0=1, as it should be perfectly correlated at 0"

acf(diff(x),na.action=na.omit)
