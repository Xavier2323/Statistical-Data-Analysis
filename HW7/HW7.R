library(readr)
library(car)

# Load the dataset
data <- read_csv('adv.csv')

# Change the column names to remove the spaces
colnames(data) <- c('TV.Ad.Budget', 'Radio.Ad.Budget', 'Newspaper.Ad.Budget', 'Sales')

# print(head(data))

# # Perform multiple linear regression
# model <- lm(Sales ~ TV.Ad.Budget + Radio.Ad.Budget + Newspaper.Ad.Budget, data = data)

# # Display the summary of the regression model
# print(summary(model))

# Perform backward elimination
reduced_model <- step(model, direction = "backward")

# Display the summary of the reduced model
print(summary(reduced_model))

# Residual plot
plot(reduced_model$fitted.values, residuals(reduced_model), main = "Residual Plot",
     xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")

# Q-Q plot
qqnorm(residuals(reduced_model))
qqline(residuals(reduced_model), col = "red")

# Identify influential observations
influence <- influence.measures(reduced_model)
# print(summary(influence))

# Remove influential observations
influential_obs <- which(apply(influence$is.inf, 1, any))
print(influential_obs)
cleaned_data <- data[-influential_obs, ]
# print(head(cleaned_data))

# Refit the model
final_model <- lm(Sales ~ TV.Ad.Budget + Radio.Ad.Budget, data = cleaned_data)

# Display the summary of the final model
print(summary(final_model))

# Test the assumptions of the linear regression model
## Test constant variance hypothesis 
ncvTest(final_model) # reject H_0 at level 0.05
print(ncvTest(final_model))

## Test the independent of residuals 
durbinWatsonTest(final_model)
print(durbinWatsonTest(final_model))

# (i) Estimated coefficients
coefficients(final_model)

# (ii) 95% confidence intervals for the coefficients
confint(final_model)

# (iii) Coefficient of determination (R^2) and Mean Square Error (MSE)
r_squared <- summary(final_model)$r.squared
mse <- mean(residuals(final_model)^2)

# Display results
cat("Estimated Coefficients:\n")
print(coefficients(final_model))
cat("\n95% Confidence Intervals:\n")
print(confint(final_model))
cat("\nCoefficient of Determination (R^2): ", r_squared, "\n")
cat("Mean Square Error (MSE): ", mse, "\n")
