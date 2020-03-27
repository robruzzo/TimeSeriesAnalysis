"MOving Average Model Demo

Unline the Autoregressive Model, the moving average model uses more white
noise terms with Beta Coefficients to give the magnitude.
x(t)=w(t) +B1Wt-1 +...BqWt-q
The white noise will have a mean of 0 and the variance of the series
THe order is q
"
set.seed(1)

#generate values for W(t) white noise
w<-rnorm(1000)

#generate values for x(t) time series x(t=1)=0
x<-rep(0,1000)

#we simulate MA(1)with one coefficient(0.4)
for(t in 3:1000)x[t]<-w[t]+0.4*w[t-1]

"
In the autocorrelation function we expect there to be a non zero significant
autocorrelation value. So if a non zero value exists we can fit MA(q) model
"
plot(x,type="l")
acf(x)

"There is no ma() function in R so we use the ARIMA model without the 
AR and Integrated part. We set them to both be 0  and MA(1)
"
x.ma<-arima(x,order=c(0,0,1))
x.ma

#The output shows that we have an MA coefficient of 0.37 with a std err of 0.0306
#Construct the confidence levels
0.37567096+c(-1.96,1.96)*0.0306
