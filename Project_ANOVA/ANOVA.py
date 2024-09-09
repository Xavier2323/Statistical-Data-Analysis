# Import numpy and pandas
import numpy as np
import pandas as pd
import statsmodels.api as sm
from statsmodels.formula.api import ols
from scipy import stats
from statsmodels.stats.multicomp import pairwise_tukeyhsd
import os

# Import visualization libraries
import plotly.express as px
import seaborn as sns
import matplotlib
import matplotlib.pyplot as plt

sns.set_style('darkgrid')
matplotlib.rcParams['font.size'] = 14
matplotlib.rcParams['text.color'] = '#FF0000'
matplotlib.rcParams['figure.figsize'] = (9, 5)
matplotlib.rcParams['figure.facecolor'] = '#00000000'

dir = "/home/xavier/course/statistics/Project_ANOVA/"
dir_image = os.path.join(dir, "images/")

# Load the dataset
ds = pd.read_csv(dir + "field_data.csv")
print(ds.info())

##### For Analysis
### height
# plot the box plot with the 'height' column
sns.boxplot(data=ds, x='height', y='yield')
plt.title('Yield Distribution by Height')
plt.savefig(os.path.join(dir_image, "height_boxplot.png"))
plt.close()

# plot the pie chart for the 'height' column
fig = px.pie(ds, names='height', title='Height Distribution')
fig.write_image(os.path.join(dir_image, "height_piechart.png"))

print('height: 1, 2')
# One-way ANOVA
# Perform one-way ANOVA
ANOVA = stats.f_oneway(ds['yield'][ds['height'] == 1],
                        ds['yield'][ds['height'] == 2])
print(ANOVA)

# Nomality test
# Perform Shapiro-Wilk test for each height column
shapiro_test_height1 = stats.shapiro(ds['yield'][ds['height'] == 1])
shapiro_test_height2 = stats.shapiro(ds['yield'][ds['height'] == 2])
print(shapiro_test_height1)
print(shapiro_test_height2)
# QQ plot
sm.qqplot(ds['yield'][ds['height'] == 1], line='s')
plt.title('Q-Q Plot for Height 1')
plt.savefig(os.path.join(dir_image, "height_qqplot_1.png"))
plt.close()

sm.qqplot(ds['yield'][ds['height'] == 2], line='s')
plt.title('Q-Q Plot for Height 2')
plt.savefig(os.path.join(dir_image, "height_qqplot_2.png"))
plt.close()

# Homogeneity of variance
# Perform Levene test
levene_test = stats.levene(ds['yield'][ds['height'] == 1],
                            ds['yield'][ds['height'] == 2])
print(levene_test)

### fertilizer
# plot the box plot with the 'fertilizer' column
sns.boxplot(data=ds, x='fertilizer', y='yield')
plt.title('Yield Distribution by Fertilizer')
plt.savefig(os.path.join(dir_image, "fertilizer_boxplot.png"))
plt.close()

# plot the pie chart for the 'fertilizer' column
fig = px.pie(ds, names='fertilizer', title='Fertilizer Distribution')
fig.write_image(os.path.join(dir_image, "fertilizer_piechart.png"))

print('fertilizer: 1, 2, 3')
# One-way ANOVA
# Perform one-way ANOVA
ANOVA = stats.f_oneway(ds['yield'][ds['fertilizer'] == 1],
                        ds['yield'][ds['fertilizer'] == 2],
                        ds['yield'][ds['fertilizer'] == 3])
print(ANOVA)

# Nomality test
# Perform Shapiro-Wilk test for each fertilizer column
shapiro_test_fertilizer1 = stats.shapiro(ds['yield'][ds['fertilizer'] == 1])
shapiro_test_fertilizer2 = stats.shapiro(ds['yield'][ds['fertilizer'] == 2])
shapiro_test_fertilizer3 = stats.shapiro(ds['yield'][ds['fertilizer'] == 3])
print(shapiro_test_fertilizer1)
print(shapiro_test_fertilizer2)
print(shapiro_test_fertilizer3)
# QQ plot
sm.qqplot(ds['yield'][ds['fertilizer'] == 1], line='s')
plt.title('Q-Q Plot for Fertilizer 1')
plt.savefig(os.path.join(dir_image, "fertilizer_qqplot_1.png"))
plt.close()

sm.qqplot(ds['yield'][ds['fertilizer'] == 2], line='s')
plt.title('Q-Q Plot for Fertilizer 2')
plt.savefig(os.path.join(dir_image, "fertilizer_qqplot_2.png"))
plt.close()

sm.qqplot(ds['yield'][ds['fertilizer'] == 3], line='s')
plt.title('Q-Q Plot for Fertilizer 3')
plt.savefig(os.path.join(dir_image, "fertilizer_qqplot_3.png"))
plt.close()

# Homogeneity of variance
# Perform Levene test
levene_test = stats.levene(ds['yield'][ds['fertilizer'] == 1],
                            ds['yield'][ds['fertilizer'] == 2],
                            ds['yield'][ds['fertilizer'] == 3])
print(levene_test)

### region
# plot the box plot with the 'region' column
sns.boxplot(data=ds, x='region', y='yield')
plt.title('Yield Distribution by Region')
plt.savefig(os.path.join(dir_image, "region_boxplot.png"))
plt.close()

# plot the pie chart for the 'region' column
fig = px.pie(ds, names='region', title='Region Distribution')
fig.write_image(os.path.join(dir_image, "region_piechart.png"))

print('region: 1, 2, 3, 4')
# One-way ANOVA
# Perform one-way ANOVA
ANOVA = stats.f_oneway(ds['yield'][ds['region'] == 1],
                        ds['yield'][ds['region'] == 2],
                        ds['yield'][ds['region'] == 3],
                        ds['yield'][ds['region'] == 4])
print(ANOVA)

# Nomality test
# Perform Shapiro-Wilk test for each region column
shapiro_test_region1 = stats.shapiro(ds['yield'][ds['region'] == 1])
shapiro_test_region2 = stats.shapiro(ds['yield'][ds['region'] == 2])
shapiro_test_region3 = stats.shapiro(ds['yield'][ds['region'] == 3])
shapiro_test_region4 = stats.shapiro(ds['yield'][ds['region'] == 4])
print(shapiro_test_region1)
print(shapiro_test_region2)
print(shapiro_test_region3)
print(shapiro_test_region4)
# QQ plot
sm.qqplot(ds['yield'][ds['region'] == 1], line='s')
plt.title('Q-Q Plot for Region 1')
plt.savefig(os.path.join(dir_image, "region_qqplot_1.png"))
plt.close()

sm.qqplot(ds['yield'][ds['region'] == 2], line='s')
plt.title('Q-Q Plot for Region 2')
plt.savefig(os.path.join(dir_image, "region_qqplot_2.png"))
plt.close()

sm.qqplot(ds['yield'][ds['region'] == 3], line='s')
plt.title('Q-Q Plot for Region 3')
plt.savefig(os.path.join(dir_image, "region_qqplot_3.png"))
plt.close()

sm.qqplot(ds['yield'][ds['region'] == 4], line='s')
plt.title('Q-Q Plot for Region 4')
plt.savefig(os.path.join(dir_image, "region_qqplot_4.png"))
plt.close()

# Homogeneity of variance
# Perform Levene test
levene_test = stats.levene(ds['yield'][ds['region'] == 1],
                            ds['yield'][ds['region'] == 2],
                            ds['yield'][ds['region'] == 3],
                            ds['yield'][ds['region'] == 4])
print(levene_test)

##### Just for visualization
### temp
# plot the box plot with the 'temp' column
sns.boxplot(data=ds, x='temp', y='yield')
plt.title('Yield Distribution by Temp')
plt.savefig(os.path.join(dir_image, "temp_boxplot.png"))
plt.close()

# plot the pie chart for the 'temp' column
fig = px.pie(ds, names='temp', title='Temp Distribution')
fig.write_image(os.path.join(dir_image, "temp_piechart.png"))

### humidity
# plot the box plot with the 'humidity' column
sns.boxplot(data=ds, x='humidity', y='yield')
plt.title('Yield Distribution by Humidity')
plt.savefig(os.path.join(dir_image, "humidity_boxplot.png"))
plt.close()

# plot the pie chart for the 'humidity' column
fig = px.pie(ds, names='humidity', title='Humidity Distribution')
fig.write_image(os.path.join(dir_image, "humidity_piechart.png"))

##### Comparing yield based on height, region, and fertilizer
### Comparing yield based on height and region
# plot the box plot with the 'height' and 'region' column
sns.boxplot(data=ds, x='height', y='yield', hue='region')
plt.title('Yield Distribution by Height and Region')
plt.savefig(os.path.join(dir_image, "height_region_boxplot.png"))
plt.close()

# plot the pie chart for the 'height' and 'region' column
fig = px.sunburst(ds, path=['height', 'region'], title='Height and Region Distribution')
fig.write_image(os.path.join(dir_image, "height_region_sunburst.png"))

### Comparing yield based on height and fertilizer
# plot the box plot with the 'height' and 'fertilizer' column
sns.boxplot(data=ds, x='height', y='yield', hue='fertilizer')
plt.title('Yield Distribution by Height and Fertilizer')
plt.savefig(os.path.join(dir_image, "height_fertilizer_boxplot.png"))
plt.close()

# plot the pie chart for the 'height' and 'fertilizer' column
fig = px.sunburst(ds, path=['height', 'fertilizer'], title='Height and Fertilizer Distribution')
fig.write_image(os.path.join(dir_image, "height_fertilizer_sunburst.png"))

### Comparing yield based on region and fertilizer
# plot the box plot with the 'region' and 'fertilizer' column
sns.boxplot(data=ds, x='region', y='yield', hue='fertilizer')
plt.title('Yield Distribution by Region and Fertilizer')
plt.savefig(os.path.join(dir_image, "region_fertilizer_boxplot.png"))
plt.close()

# plot the pie chart for the 'region' and 'fertilizer' column
fig = px.sunburst(ds, path=['region', 'fertilizer'], title='Region and Fertilizer Distribution')
fig.write_image(os.path.join(dir_image, "region_fertilizer_sunburst.png"))
