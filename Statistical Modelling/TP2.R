rm(list=ls())

cum.mean <- function(x){
  return (cumsum(x)/(1:length(x)))
}
test <- c(2,2,5,4)
cum.mean(test)

x <- rexp(1000,2)
plot(1:1000,cum.mean(x), type = "l")
abline(h=0.5)

#exercice 2

fun <- function(x,n) {
  return ((1/sqrt(n))*sum(x-sqrt(n)))
}

sample.Z <- function(n,m) {
  z <- numeric (m)
  for (i in (1:m)) {
    x = runif (n,0,2)
    z[i] <- sum(x)}
  return (z/sqrt(n) - sqrt(n))
}
n <- 10
m <- 1000
Z <- sample.Z(n,m)

hist(Z, freq = F, breaks = 50)
lines(density(Z), lwd = 2, col="royalblue")

curve(dnorm(x, sd = 1/sqrt(3)), add = T, lwd = 2, col = "firebrick")





