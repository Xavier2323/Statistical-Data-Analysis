# lab 4 : Common distribution

## normal-----------
n.pdf = function(x,mean,sd){
  (2*pi*sd^2)^(-1/2) * exp(- 1/2*( (x - mean)/sd )^2)
} # build pdf by you
seq = seq(from= -3,to =1, by=1e-6) # define small increment
prob= 0 
for (i in 1:length(seq)){
  a = 1e-6 * n.pdf(seq[i],0,1)
  prob <- prob + a
} 
prob  ### approximately P(N(0,1) in (-3,1)) by Riemann sum

pnorm(1) - pnorm(-3)  ### P(-3 <X< 1) = P(X < 1) - P(X <-3)

x = rnorm(n = 100000,mean = 0,sd = 1)
hist(x = x, xlab="normal" , ylab="pdf",freq = FALSE)
xx = seq(min(x),max(x),by=0.01)
yy = dnorm(xx)
lines(x= xx ,y = yy,col="red",lwd=2) ### note x and y have the same length

## Geometric and NB-----------
  # see ?rgeom => also see dgeom pgeom qgeom
  # see ?rnbinom => also see dnbinom pnbinom qnbinom
x = rgeom(n = 100000,prob = 0.3) #defined by # of failure
mean(x) ### sample mean 
1/0.3 - 1  ### exact mean

hist(x,las=1,freq=FALSE,main="hist. of Geo(0.3)")
lines(x = 0:30,y = dgeom(0:30,prob = 0.3),col="red",lwd=2)

y = rnbinom(n = 100000,size = 1,prob = 0.3)
mean(y)  ### compare mean(x)=> Geo is special case of NB.


## Binomial-----------

x = rbinom(n = 1000,size = 10,prob = 0.5)
y = replicate(n = 1000,expr = {
  sum(sample(x = c(0,1),size = 10,replace = TRUE,prob = c(0.5,0.5)))
  })
mean(x) ; mean(y)

pbinom(q = 5,size = 10,prob = 0.5) ### P(Bin(10,0.5) <=5)
pbinom(q = 5,size = 10,prob = 0.5,lower.tail = FALSE) # P(Bin(10,0.5)>5)


## Poisson ------------
x = rpois(n = 1e+06,lambda = 10) ### in practice, lambda > 9 => Normal approximation 
hist(x,main="Pois(10)",freq = FALSE,
     xlim = c(0,20) ,xaxt="n")
axis(side=1, at=seq(0, 20, by=1) , cex.axis=0.8) # customize x axis

xx = seq(0,20,by=1)
xx1 = xx + 0.5
xx2 = xx - 0.5  ### 0.5 : continuity correction
yy1 = dbinom(x = xx, size = 10000,prob = 0.001) ###bin. pmf
yy2 = dpois(x=xx,lambda = 10) ###pois pmf
yy3 = pnorm(q = xx1,mean = 10,sd = sqrt(10) ) -
  pnorm(q = xx2,mean = 10,sd = sqrt(10) ) 
### normal pdf f(x) = P(x-0.5<X<x+0.5) by De Moivre-Laplace thm
lines(x = xx,y=yy1,lty = 2,lwd=2,col="red")
lines(x= xx, y=yy2,lty = 2,lwd=4,col="blue")
lines(x= xx, y=yy3,lty = 3,lwd=5,col="green")
legend("topright",legend = c("Bin(10000,0.001)","Pois(10)","N(10,10)"),
       col=c("red","blue","green"), lty=c(2,2,3),cex=0.7)
### approximation of normal improves as lambda increase  

## Bin equal approximately Pois because (1+x/n)^n approx e^x
n=1000000
x = 10
(1+x/n)^n
exp(x)
