
"
The time series is stationary (as far as the mean in concerned) 
if the mean is constant  u(t)=u

The time series is stationary (as far as the variance is concerned)
if the variance is constant o(t)^2=o^2

But some x(t) observations may be correlated: so we may over or 
under estimate the actual variance

Second order stationarity: if we assume that the x(t)series is 
stationary in the mean and the variance:

A given X(t) time series is second order stattionary if the correlation
between observations is the function of the lag exclusively. 
(The function of the time steps separating each sequential observation)

Autocovariance (serial covariance) for the second order stationary time
series: 
Covk =E[(xk-u)(xt+k-u)] item t and item t+k steps away (x)

Autocorrelation for second order stationary time series:
corrk = Covk/variance
"

"Note: The first value acf(0)=1 the series correlates with itself 
perfectly! The autocoorrelation is approximately 0, the values are
independent from each other!
"
set.seed(1)
x<-rnorm(1000)
acf(x)

#There is a trend: the acf is appx linear, and is not stationary
x<-seq(1,1000)
plot(x)
acf(x)

set.seed(1)
var(rnorm(2000,mean=0,sd=1))

