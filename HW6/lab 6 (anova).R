# R lab6 : anova

# one-way anova
## Data for GPA
x = read.csv(file="school.csv", header=T)
head(x)
boxplot(GPA~School, data=x)

model = lm(GPA ~ School, data=x)
summary(model)  # Estimates
anova(model)      # anova table 

## fitted mean of each group , compared it with the sample mean of each group 
fitted = data.frame(cbind("School"=x$School,"mean" = model$fitted.values))
origin.mean = aggregate(GPA~School, data=x, FUN=mean)
cbind(origin.mean,
      "fitted.mean.GPA"=aggregate(mean~School, data=fitted, FUN=unique)$mean )

## checking normality assumption
qqnorm(model$residuals,ylab = "raw residuals")
qqline(model$residuals, lwd=2, col=4)

## checking homogeneity of variance 
plot(x=model$fitted.values, y = resid(model), 
     xlab="fitted values", ylab="raw residuals")
abline(h = 0, lwd=2, col=2)  # or show normality and homogeneity both side by side:

par(mfrow=c(1,2))
plot(model,which = c(1,2))


## test homogeneity of variance by levene's test
library(car)
leveneTest(model, center=mean) # or center = median
library(s20x) # or use this package
levene.test(model)

# two-way anova

## Data for printing3D
x = read.csv(file ="printing3D_data.csv",header = T)
str(x)
head(x)

## boxplot for categorical-type data (factors):
par(mfcol=c(2,3))
boxplot(roughness~material, data=x); title("roughness vs material")
boxplot(roughness~infill_pattern, data=x); title("roughness vs infill_pattern")
boxplot(tension_strength~material, data=x); title("tension_strength vs material")
boxplot(tension_strength~infill_pattern, data=x); title("tension_strength vs infill_pattern")
boxplot(elongation~material, data=x); title("elongation vs material")
boxplot(elongation~infill_pattern, data=x); title("elongation vs infill_pattern")

## Two-way ANOVA
# Response: elongation
# Factors: material, infill_pattern (both are two-level variables)
# Note that in the example, we have multiple measurements given each combination of factors

model =lm(elongation ~ material + infill_pattern, data= x)
summary(model)  # anova table; or 
anova(model)

### fitted mean
fitted = round(model$fitted.values,4)
fit.data = cbind(x, fitted)
cbind( aggregate(elongation~material+infill_pattern, data=fit.data, FUN=mean),
       "fitted.mean"=aggregate(fitted~material+infill_pattern, data=fit.data, FUN=unique)$fitted)

### checking normality assumption
qqnorm(model$residuals, ylab="raw residuals") 
qqline(model$residuals, lwd=2, col=4)

### Check Equal Variance Assumption and test by Levene's test
plot(x=model$fitted.values, y = resid(model), 
     xlab="fitted values", ylab="raw residuals")
abline(h = 0, lwd=2, col=2)  # or show normality and homogeneity both side by side:

par(mfrow=c(1,2))
plot(model,which = c(1,2))

levene.test(model) 

#2-way ANOVA # Consider both layer_height and fan_speed as categorical variables 

model =lm(elongation ~ as.factor(layer_height) + as.factor(fan_speed), data= x)
summary(model)  # anova table; or 
anova(model)
par(mfrow=c(1,2))
plot(model,which = c(1,2))
### Check Equal Variance Assumption by Levene's test
levene.test(model)

