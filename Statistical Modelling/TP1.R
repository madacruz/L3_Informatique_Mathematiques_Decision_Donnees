#exo1
x1<-rbinom(500, size=1, prob=0.4)
x2<-rbinom(500, size=50, prob=0.4)
x3<-rpois(500, lambda=2)
y1<-runif(1000, min=2, max=5)
y2<-rexp(1000, 2)
y3<-rnorm(1000,1,sqrt(2))
y4<-rchisq(1000,df=3)
y5<-rt(1000,5)

urn<-1:24
res1<-sample(urn,size=10,replace=FALSE,prob=NULL)
res2<-sample(urn,size=10,replace=TRUE,prob=NULL)
res3<-sample(urn,size=10,replace=FALSE,prob=NULL)

#exo2
#1-pexp(0.5,2)
#pexp(5,2)
#pexp(10,2)-pexp(1,2)
#1-pnorm(3)
#pnorm(-0.2)
#1-pnorm(2)+pnorm(-2)

#exo3
t<-seq(0,10,0.01)
#plot(t,pexp(t,2),type="l",col="blue",main="cdf",xlab="t",ylab="blabla")

#table(x3)
#table(x3)/500

xfreq<- table(x3)/500 #on div par la taille pour avoir la freq
#barplot(xfreq)
#par(mfrow=c(1,2))
#barplot(dpois(0:max(x3),2))

#hist(y4,freq=F,breaks=50, col="grey60", border="grey80")

#curve(dchisq(x,3),add=TRUE)

x.freq <- table(x3)/length(x3)
par(mfrow=c(1,2), oma=c(0,0,2,0))
barplot(x.freq, ylim = c(0, max(x.freq)), main = "Distribution of the sample")
barplot(dpois(0:max(x3), 2), ylim = c(0, max(x.freq)), main = "Theoretical distribution", names.arg = 0:max(x3))
title(expression(paste("Poisson distribution (", lambda == 2, ")")),outer=TRUE)

#Exercice 4
qbinom(0.3,50,0.4)
quantile(x2, seq(0.1, 0.9, 0.1))