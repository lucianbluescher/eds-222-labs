rm(list = ls())

### Gamma distribution [dgamma()] 
#1 Define the possible outcomes
gam <- tibble(
  g = seq(0, 10, by = 0.1)
)

#2: Choose our parameters
alpha = 4
delta = 1

#3: Calculate gamma
gam <- mutate(gam, gamma = dgamma(g, shape = alpha, rate = delta)
)

#4: Plot

ggplot(gam, aes(g, gamma)) +
  geom_line()
#--------------------------------------------------------

### Poisson distribution [dpois()]

#1. define the possible outcomes
pois <- tibble(
  x = seq(0, 20, by = 1)
)

#2. Choose our parameters
lambda <- 1

#3. Calcualte density
pois <- mutate(pois, mass = dpois(x, lambda = lambda))

#4. Plot
ggplot(foo, aes(x, mass)) +
  geom_line()

#--------------------------------------------------------

## Probability Density Function
# 1. Define possible outcomes
# Normal(0, 1)
normal_pdf<- tibble(
  x = seq(-3, 3, length.out = 100)
)

#2: Choose our parameters
mu <- 0
sigma <- 1

#3: Calculate gamma
normal_pdf <- mutate(normal_pdf, 
                     pdf = dnorm(x, mean = mu, sd = sigma)
)

#4: Plot

ggplot(normal_pdf, aes(x, pdf)) +
  geom_line()

#--------------------------------------------------------
NOT DONE
## Probability Mass Function
# 1. Define possible outcomes
# Binomial(0, 1)
binomial_pmf<- tibble(
  x = seq(-2, 3, length.out = 100)
)

#2: Choose our parameters
size <- 1
prob <- 10

#3: Calculate PMF/PDF
binomial_pmf <- mutate(binomial_pmf, 
                     pdf = dbinom(x, size = size, prob = prob)
)

#4: Plot

ggplot(binomial_pmf, aes(x, pdf)) +
  geom_line()


#--------------------------------------------------------

## Beta Probability Density Function
# How many years after a coral bleaching event what amount of the coral reef is covered in algae
# Match random variables with outcomes

# 1. Define possible outcomes

# Beta(2, 7)
beta_pdf<- tibble(
  x = seq(0,1, length.out = 100)
)

#2: Choose our parameters
a <- 2
b <- 7

#3: Calculate PMF/PDF
beta_pdf <- mutate(beta_pdf, 
                     pdf = dbeta(x, shape1 = a, shape2 = b)
)

#4: Plot

ggplot(beta_pdf, aes(x, pdf)) +
  geom_line()
