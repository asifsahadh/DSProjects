# NOTE: d - probability of an exact outcome, p - cumulative probability, q - exact value, r - random generator

# BINOMIAL DISTRIBUTION BASED PROBLEMS

# 1a
dbinom(2, 9, 0.3)

# 1b
pbinom(3, 9, 0.3)

# 1c
1 - pbinom(3, 9, 0.3)

# 1d
dist = rbinom(250, 9, 0.3)
hist(dist, probability = T, main = 'Histogram of Binomial Distribution',
     xlab = "Number of Successes", col = 'royalblue')
lines(density(dist), col = 'black', lwd = 2)

# 2a
1 - pbinom(3, 6, 0.2)

# 2b
dbinom(2, 6, 0.2)

# 2c
1 - pbinom(2, 6, 0.2)

# 2d
dist = rbinom(200, 6, 0.2)
hist(dist, probability = T, main = "Histogram No. 2",
     col = "pink")
lines(density(dist), col = 'black', lwd = 2)

# 3a
dbinom(2, 9, 0.3)

# 3b
1 - pbinom(2, 9, 0.3)

# 3c
pbinom(5, 9, 0.3)

# 3d
dist = rbinom(350, 9, 0.3)
hist(dist, probability = T, main = 'Histogram for Question 3d',
     col = 'lightblue')
lines(density(dist), col = 'black', lwd = 2)

# POISSON DISTRIBUTION BASED PROBLEMS

# 1a
dpois(2, 1.5)

# 1b
1 - ppois(2, 1.5)

# 1c
dist = rpois(500, 1.5)
hist(dist, probability = T, main = 'Poisson Histogram', col = 'lightgreen')
lines(density(dist), col = 'black')

# 2
dpois(0, 2)

dpois(3, 2) + dpois(4, 2)

dist = rpois(250, 2)
hist(dist, probability = T, col = 'gray', main = 'Poisson 2.0')
lines(density(dist), col = 'black')

# 3a
1 - ppois(2, 1)

# 3b
dpois(4, 1)

# 3c
ppois(7, 1)

# 3d
dist = rpois(400, 1)
hist(dist, probability = T, col = 'purple')
lines(density(dist), col = 'black')

# NORMAL DISTRIBUTION BASED PROBLEMS

# 1a
mean = 450
sd = 100
pnorm(500, mean, sd) - pnorm(400, mean, sd)

# 1b
a = 1 - pnorm(630, mean, sd) # better
b = pnorm(630, mean, sd) # worse

# 1c
1 - pnorm(450, mean, sd)

# 1d
dist = rnorm(300, mean, sd)
hist(dist, probability = T, main = 'Normal Histogram Only', col = 'red')
lines(density(dist), col = 'black')

# 2a
mean = 300
sd = 25
1 - pnorm(350, mean, sd)

# 2b
pnorm(260, mean, sd) - pnorm(220, mean, sd)

# 2c
pnorm(300, mean, sd)

# 2d
dist= rnorm(300, mean, sd)
hist(dist, col = 'yellow', probability = T)
lines(density(dist), col = 'black')

# 3a 
mean = 42
sd = 24
(1 - pnorm(50, mean, sd)) * 1000

# 3b
(pnorm(54, mean, sd) - pnorm(30, mean, sd)) * 1000

# 3c
qnorm(0.9, mean, sd)

# 3d
dist = rnorm(300, mean, sd)
hist(dist, col = 'darkgreen', probability = T)
lines(density(dist), col = 'black')