### Q3
# Given discharge data
discharge <- c(1, 3, 7, 8, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 29, 32, 35, 40, 42, 45, 50)

# Step (a): Calculate standard normal quantiles
n <- length(discharge)
Y <- qnorm((1:n - 0.5) / n)
print(Y)

# Step (b): Draw Q-Q plots
par(mfrow = c(1, 2)) # Set up a 1x2 plot layout
qqnorm(Y) # Q-Q plot using theoretical quantiles
qqline(Y) # Add a reference line
qqnorm(discharge) # Q-Q plot using original discharge data
qqline(discharge) # Add a reference line

### Q4
# Load the iris dataset
data(iris)

par(mfrow = c(1, 1)) # Set up a 1x2 plot layout
# (a) Draw boxplots for Sepal.Length by Species
boxplot(Sepal.Length ~ Species,
    data = iris,
    xlab = "Species", ylab = "Sepal Length",
    main = "Boxplot of Sepal Length by Species"
)

# (b) Perform ANOVA test
model <- lm(Sepal.Length ~ Species, data = iris)
anova_result <- anova(model)
print(anova_result)


# (c) Check assumptions: normality and homogeneity of variance
# Normality assumption
shapiro_test_results <- by(iris$Sepal.Length, iris$Species, shapiro.test)
print(shapiro_test_results)
qqnorm(model$residuals, ylab = "raw residuals")
qqline(model$residuals, lwd = 2, col = 4)


# Homogeneity of Variance assumption

# install.packages("car")
library(car)
levene_test_result <- leveneTest(model, center = mean)
print(levene_test_result)
