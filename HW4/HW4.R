### Problem 1
lambda <- 35.304
cases_observed <- 18

probability <- ppois(cases_observed, lambda)

cat("The probability of observing 18 or fewer cases is", probability, "\n")

### Problem 2
# Set up
mu <- 18.5
sigma <- 5
n <- 50
p <- 0.3
size <- 5
prob <- 0.3

# Normal distribution
normal_lt_16 <- pnorm(16, mean = mu, sd = sigma)
normal_leq_16 <- pnorm(16, mean = mu, sd = sigma, lower.tail = TRUE)
normal_eq_25 <- dnorm(25, mean = mu, sd = sigma)
normal_gt_20 <- 1 - pnorm(20, mean = mu, sd = sigma)

# Binomial distribution
binom_lt_16 <- pbinom(15, size = n, prob = p)
binom_leq_16 <- pbinom(16, size = n, prob = p)
binom_eq_25 <- dbinom(25, size = n, prob = p)
binom_gt_20 <- 1 - pbinom(20, size = n, prob = p)

# Negative binomial distribution
neg_binom_lt_16 <- pnbinom(15, size = size, prob = prob)
neg_binom_leq_16 <- pnbinom(16, size = size, prob = prob)
neg_binom_eq_25 <- dnbinom(25, size = size, prob = prob)
neg_binom_gt_20 <- 1 - pnbinom(20, size = size, prob = prob)

# Print the table
cat("Distribution\tP(X < 16)\tP(X ≤ 16)\tP(X = 25)\tP(X > 20)\n")
cat("Normal\t\t", normal_lt_16, "\t", normal_leq_16, "\t", normal_eq_25, "\t", normal_gt_20, "\n")
cat("Binomial\t", binom_lt_16, "\t", binom_leq_16, "\t", binom_eq_25, "\t", binom_gt_20, "\n")
cat("Negative Binomial", neg_binom_lt_16, "\t", neg_binom_leq_16, "\t", neg_binom_eq_25, "\t", neg_binom_gt_20, "\n")

### Problem 3
mu <- 18.5
sigma <- 5
n <- 50
p <- 0.3
size <- 5
prob <- 0.3

# Normal distribution
normal_quantile_25 <- round(qnorm(0.25, mean = mu, sd = sigma))
normal_quantile_75 <- round(qnorm(0.75, mean = mu, sd = sigma))
normal_quantile_85 <- round(qnorm(0.85, mean = mu, sd = sigma))

# Binomial distribution
binom_quantile_25 <- qbinom(0.25, size = n, prob = p)
binom_quantile_75 <- qbinom(0.75, size = n, prob = p)
binom_quantile_85 <- qbinom(0.85, size = n, prob = p)

# Negative binomial distribution
neg_binom_quantile_25 <- qnbinom(0.25, size = size, prob = prob)
neg_binom_quantile_75 <- qnbinom(0.75, size = size, prob = prob)
neg_binom_quantile_85 <- qnbinom(0.85, size = size, prob = prob)

# Print the table
cat("Distribution\t(P(X < x) = 0.25)\t(P(X > x) = 0.25)\t(P(X ≥ x) = 0.15)\n")
cat("Normal\t\t", normal_quantile_25, "\t\t\t", normal_quantile_75, "\t\t\t", normal_quantile_85, "\n")
cat("Binomial\t", binom_quantile_25, "\t\t\t", binom_quantile_75, "\t\t\t", binom_quantile_85, "\n")
cat("Neg Binomial\t", neg_binom_quantile_25, "\t\t\t", neg_binom_quantile_75, "\t\t\t", neg_binom_quantile_85, "\n")

### Problem 4
# Define parameters
p <- 0.001
n_values <- c(100, 500, 1000, 5000)
k_values <- 0:10

binomial_probs <- list()
poisson_probs <- list()

# Calculate probabilities
for (n in n_values) {
  # Binomial distribution
  binomial_probs[[as.character(n)]] <- dbinom(k_values, size = n, prob = p)
  
  # Poisson distribution
  lambda <- n * p
  poisson_probs[[as.character(n)]] <- dpois(k_values, lambda)
}


par(mfrow = c(1, 2))

colors <- rainbow(length(n_values))

# Plot Binomial PMFs
plot(NULL, xlim = c(-0.5, 10.5), ylim = c(0, 0.2), xlab = "k", ylab = "Probability", main = "Binomial Distribution", cex.main = 0.9)

for (i in seq_along(n_values)) {
  lines(k_values, binomial_probs[[as.character(n_values[i])]], type = "b", pch = 19, col = colors[i], lty = 1, lwd = 2)
}

legend("topright", legend = paste("n =", n_values), col = colors, lty = 1, lwd = 2, pch = 19, title = "Sample Size")

# Plot Poisson PMFs
plot(NULL, xlim = c(-0.5, 10.5), ylim = c(0, 0.2), xlab = "k", ylab = "Probability", main = "Poisson Distribution", cex.main = 0.9)

for (i in seq_along(n_values)) {
  lines(k_values, poisson_probs[[as.character(n_values[i])]], type = "b", pch = 19, col = colors[i], lty = 2, lwd = 2)
}

legend("topright", legend = paste("n =", n_values), col = colors, lty = 2, lwd = 2, pch = 19, title = "Sample Size")

par(mfrow = c(1, 1))  # Reset the plotting layout