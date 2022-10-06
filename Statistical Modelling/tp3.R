load("C:/Users/mathi/OneDrive/Bureau/Cours L3 IM2D/Statistical modelling (4)/TP/TP STAT/Heads_Tails.RData")

y = x
x[x=="Head"] = 1
x[x=="Tail"] = 0
x = as.numeric(x)

p.hat <- mean(x)
s2.hat <- mean((x - p.hat)^2)

alpha <- 0.05
q <- qnorm(1 - 0.5 * alpha)
n <- length(x)

p.evol <- cum.mean(x)
s2.evol <- cum.mean(x^2) - cum.mean(x)^2

plot(p.evol, ylim = c(0, 0.7), type = "l", col = "steelblue3", xlab = "n")
lines(p.evol - q*sqrt(s2.evol/(1:200)), col = "tan1")
lines(p.evol + q*sqrt(s2.evol/(1:200)), col = "tan1")
abline(h = 0.5, col = "gray60", lty = 2, lwd = 2)

     