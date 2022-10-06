rm(list=ls())

load("C:/Users/mathi/OneDrive/Bureau/Cours L3 IM2D/Statistical modelling (4)/TP/TP STAT/Heads_Tails.RData")

y = x
y[y=="Head"] = 1
y[y=="Tail"] = 0
y = as.numeric(y)

pn <- function(n){
  return(sum(y[1:n])/n)
}

snsquare <- function(n){
  return(sum((y[1:n]-pn(n))^2)/n)
}

#Question 4
#We repeat the same experiment independently 200 times, with a certain 
#probability p to "win" (Head) and a certain probability 1-p to "fail" (Tail)
#Thus we choose the binomial model
#If p is close to 1/2, the coin is balanced

#Question 5
#Loi des grands nombres

conf_int_inf <- function(n,alpha=0.05){
  return(pn(n) - qnorm(1-alpha/2)*sqrt(snsquare(n)/n))
}
conf_int_sup <- function(n,alpha=0.05){
  return(pn(n) + qnorm(1-alpha/2)*sqrt(snsquare(n)/n))
}

n = 200
print(conf_int_inf(n,0.05), conf_int_sup(n,0.05))
print(conf_int_inf(n,0.1), conf_int_sup(n,0.1))

plot(1:200,lapply(1:200, pn),type = 'l', col="blue", ylim=c(0,1))
lines(1:200,lapply(1:200, conf_int_inf),type = 'l', col="red")
lines(1:200,lapply(1:200, conf_int_sup),type = 'l', col="red")
abline(h = 0.5, col = "mediumseagreen")
