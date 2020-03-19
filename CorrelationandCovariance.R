#In this case there is a positive covariance between the two variables x,y
x<-seq(1,100)
y<-seq(101,200)

plot(x)
plot(y)

cov(x,y)
 
# in this case the covariance is approximately 0: x and y are independent variables
set.seed(1)
x<-rnorm(1:100)
plot(x)

set.seed(2)
y<-rnorm(1:100)
plot(y)

cov(x,y)

#correlation is in the range [,-1,1] so it is a normalized covariance
cor(x,y)
#this is how we calculate it so it yields the same result (correlation)
cov(x,y)/(sd(x)*sd(y))
