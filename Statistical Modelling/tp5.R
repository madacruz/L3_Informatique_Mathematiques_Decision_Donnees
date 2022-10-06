setwd("C:/Users/mathi/OneDrive/Bureau/Cours L3 IM2D/Statistical modelling (4)/TP/TP STAT")
tab<-read.table("e_comp.csv",header=TRUE,sep=";")

x=as.numeric(tab[,2])

theta.hat<-function(x){
  return(length(x)/sum(x))}

f.hat<-function(t,x) {
  return (mean(x<=t))
}

F.hat.evo <-function(t,x) {
  y = numeric(length(x))
  for (i in (1:length(x))) {
    y[i] <- f.hat(t,x[1:i])  }
  return (y)
}

bootstrap<- function(K) {
  bvec <- vector(length = K)
  for (k in (1:K)) {
  sampleK <- sample(x, length(x), TRUE)
  bvec[k] = theta.hat(sampleK)
  }
  return ((sum(bvec)/K)- theta.hat(x))
}

var_hat <- function(x) {
  return(sum((x-mean(x))^2)/length(x))
}

bootstrap_var<- function(K) {
  bvec <- vector(length = K)
  for (k in (1:K)) {
    sampleK <- sample(x, length(x), TRUE)
    bvec[k] = theta.hat(sampleK)
  }
  return (var(bvec))
}
q=qnorm(0.975)
borninf_norm = theta.hat(x)-q*sqrt(bootstrap_var(200))
bornsup_norm = theta.hat(x)+q*sqrt(bootstrap_var(200))



quantile_b<- function(K) {
  bvec <- vector(length = K)
  for (k in (1:K)) {
    sampleK <- sample(x, length(x), TRUE)
    bvec[k] = theta.hat(sampleK)
  }
  return (quantile(bvec,probs = c(0.025,0.975)))
}
borninf_norm
bornsup_norm
quantile_b(200)

