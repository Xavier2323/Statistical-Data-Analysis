
# Problem 1 & 2

## 2.(a)
samp_mean <- rep(NA,100)
n <- 10

set.seed(1231)
for (i in 1:100){
  samp <- rnorm(n,mean = 5,sd = 5)
  samp_mean[i] <- mean(samp)
}

### Construct the confidence intervals
lower_vector <- samp_mean - qnorm(p = 0.975) * 5/sqrt(n)
upper_vector <- samp_mean + qnorm(p = 0.975) * 5/sqrt(n)

### construct whether capture mu
capture_mu = ifelse(lower_vector < 5 & upper_vector > 5, "yes", "no")

summarized.data = data.frame("id" = c(1:100,1:100), 
                             "ci" = c(lower_vector,upper_vector),
                             "capture"= c(capture_mu, capture_mu))
### display plot by ggplot2
library(ggplot2)
ggplot(data = summarized.data, aes(x = ci, y = id, 
                                   group = id, color = capture)) +
  geom_point(size = 2) + 
  geom_line() +          
  geom_vline(xintercept = 5, color = "black")

## 2.(b)
samp_mean <- rep(NA,100)
n <- 1000

for (i in 1:100){
  samp <- rpois(n,lambda = 5)
  samp_mean[i] <- mean(samp)
}

### Construct the confidence intervals approximately
lower_vector <- samp_mean - qnorm(p = 0.975) * sqrt(samp_mean/n)
upper_vector <- samp_mean + qnorm(p = 0.975) * sqrt(samp_mean/n)

### construct whether capture lambda
capture_mu = ifelse(lower_vector < 5 & upper_vector > 5, "yes", "no")

summarized.data = data.frame("id" = c(1:100,1:100), 
                             "ci" = c(lower_vector,upper_vector),
                             "capture"= c(capture_mu, capture_mu))
### display plot by ggplot2
ggplot(data = summarized.data, aes(x = ci, y = id, 
                                   group = id, color = capture)) +
  geom_point(size = 2) + 
  geom_line() +          
  geom_vline(xintercept = 5, color = "black")



# Problem 3
## (a) Ha: p <0.5
pnorm( (482 - 500)/sqrt(1000*0.5*0.5) ) # => do not reject
 ## (b) Ha: p> 0.5
1-pnorm( (535 - 500)/sqrt(1000*0.5*0.5) ) # => reject H0
## (c) Ha : p<0.5
pnorm( (465 - 500)/sqrt(1000*0.5*0.5) ) # => reject H0


# Problem 4
Oi = c(1968, 1919, 2042, 1932, 2003, 2136)
Ei = 12000*1/6

sum( (Oi-Ei)^2/Ei ) > qchisq(p = 0.95,df = 6-1)

chisq.test(Oi)


# Problem 5

## not use chisq.test
original = matrix( c(14, 32, 37,
                     19, 17, 42,
                     12, 10 ,17),byrow = T,
                   ncol = 3,nrow = 3)
row_marginal = rowSums(original)
col_marginal = colSums(original)
expected = outer(row_marginal,col_marginal)/200 

sum( (original - expected)^2/ expected) > qchisq(p = 0.95,df = 4)


# Exercise 6.15
qnorm(0.95)^2 * 0.55*0.45 / 0.05^2 #

# exercise 6.21
## (a)
(0.79 - 0.55) + c(-1,1) * qnorm(0.975) * 
  sqrt(0.79*0.21/347 + 0.55*0.45/617) #=> no sufficient edvience conclude no difference

## (b) TRUE based on 95% confidance.
