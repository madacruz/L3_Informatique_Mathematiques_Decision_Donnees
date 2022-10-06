setwd("C:/Users/mathi/OneDrive/Bureau/Cours L3 IM2D/Statistical modelling (4)/TP/TP STAT")
tab<-read.table("e_comp.csv",header=TRUE,sep=";")

x=as.numeric(tab[,2])

f.hat<-function(t,x) {
  return (mean(x<=t))
}

F.hat.evo <-function(t,x) {
  y = numeric(length(x))
  for (i in (1:length(x))) {
    y[i] <- f.hat(t,x[1:i])  }
  return (y)
}

p <- f.hat.evo(106,x)
plot(1:length(x), p, type = 'l', col = 'firebrick')

eps <- qnorm(0.975) * sqrt(p * (1 - p)/(1:length(x)))
(n.star <- max(which(eps > 0.1)) + 1)

c(p[n.star] - eps[n.star], p[n.star] + eps[n.star])

F.hat.vec <- function(t, x) {
  ans <- numeric(length(t))
  for (i in 1:length(t)) {
    ans[i] <- sum(x <= t[i])
  }
  return(ans/length(x))
}
t <- seq(0, 500, 0.1)

plot(t, F.hat.vec(t, x[1:10]), type = "l", lwd = 2, col = "tomato3")

lines(t, F.hat.vec(t, x[1:50]), lwd = 2, col = "violetred4")
lines(t, F.hat.vec(t, x[1:100]), lwd = 2, col = "tan2")
lines(t, F.hat.vec(t, x[1:200]), lwd = 2, col = "slategray4")
lines(t, F.hat.vec(t, x[1:500]), lwd = 2, col = "darkolivegreen")
#legend("bottomright", box.lty = 0, bg = "gray95", inset = 0.05, , lwd = 2, c("m = 10", "m = 50", "m = 100", "m = 200", "m = 500"), col = c("tomato3", "violetred4", "tan2", "slategray4", "darkolivegreen"))

x.10 <- sample(x, 10, replace = TRUE)
x.50 <- sample(x, 50, replace = TRUE)
x.100 <- sample(x, 100, replace = TRUE)
x.200 <- sample(x, 200, replace = TRUE)
x.500 <- sample(x, 500, replace = TRUE)


plot(t, F.hat.vec(t,x), type = "l", lty = 2, lwd = 3, col = "steelblue4",
     main = "Convergence of the empirical distribution", ylim = c(0, 1))
lines(t, F.hat.vec(t, x.10), lwd = 2, col = "tomato3")
lines(t, F.hat.vec(t, x.50), lwd = 2, col = "violetred4")
lines(t, F.hat.vec(t, x.100), lwd = 2, col = "tan2")
lines(t, F.hat.vec(t, x.200), lwd = 2, col = "slategray4")
lines(t, F.hat.vec(t, x.500), lwd = 2, col = "royalblue")
#legend("bottomright", box.lty = 0, bg = "gray95", inset = 0.05, lwd = 2,c(expression(hat(F)[n]), "m = 10", "m = 50", "m = 100", "m = 200","m = 500"), col = c("steelblue4", "tomato3", "violetred4", "tan2","slategray4", "royalblue"), lty = c(2, rep(1, 5)))
