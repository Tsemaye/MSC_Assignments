#!/usr/bin/env python
# coding: utf-8

# ## Business Use Case: Improving Wine Quality for Competitive Advantage
# 
# ### Objective: Identify which chemical properties (features) have the most significant impact on wine quality ratings (That is our target variable is quality). This insight allows wine producers to optimize their production processes to consistently achieve higher quality wines, ultimately leading to greater customer satisfaction and competitive positioning in the market.
# 
# ### Goal: Use historical data to uncover insights that can guide production, such as optimal alcohol levels or acidity levels, which tend to correlate with higher quality ratings. This can also help producers understand the characteristics of wines that receive high ratings from consumers or experts.

# In[26]:


import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
#Impoting the neccessary libraries. I still imported some below


# In[2]:


charis_wine = pd.read_csv("/Users/caleboneyemi/Downloads/wine+quality/winequality-red.csv")
#Just loading the data set I got from Kaggle into a pandas datafram named charis_wine 

charis_wine.head()


# In[3]:


charis_wine = pd.read_csv("/Users/caleboneyemi/Downloads/wine+quality/winequality-red.csv", sep =";")
# I added this sep=";" to tell pandas to use ; as a seperator for columns
charis_wine.head()


# In[23]:


charis_wine.isnull().sum()


# In[4]:


#charis_wine = charis_wine.drop(columns=['Unnamed:0'])
# I'm taking out the first column because it's not really neccessary
# Unnamed: 0 is just the default term for first column that has no heading (0 is the index position of the first column in Python)

#columns is a keyword here. It holds a list of columns i want to work with in this case "DROP"
#charis_wine.head()


# In[5]:


print(charis_wine.columns)


# So there's no unnamed column after all

# # Descriptive Statistics
# 
# I want to do the Descriptive statistics but first of all, i'll assign all my features to a new data frame called features_df so my target varible (the dependent variable) which is quality is excluded

# In[6]:


features_df = charis_wine.drop(columns=["quality"])

features_df.head()


# ## Measures of central tendency
# 
# These will help describe the overall characteristics of the data by highlighting where most values tend to cluster providing a simple summary of a large dataset, allowing for quick insights without examining every individual data point.
# 
# We could use this for comparison of different datasets. For example, we could compare the average alcohol content between different wine varieties or regions.
# 
# We can use the average quality rating of wines can help winemakers assess how well their product is perceived.
# 
# The measures of central tendency will also help us understand the distribution of the data ie the shape and skewness 
# 
# Shape of Data: The relationship between mean, median, and mode can provide insights into the shape of the data distribution
# If mean = median = mode, the data is likely normally distributed.
# If mean > median > mode, the data is positively skewed (tail on the right).
# If mean < median < mode, the data is negatively skewed (tail on the left).
# 
# Identifying Skewness: Knowing the distribution helps you understand how data behaves and whether it’s appropriate to use certain statistical methods.
# 
# 
# Types of Skewness
# Positive Skew (Right Skew)
# Example: Income distribution is often positively skewed; most people earn an average income, but a few individuals earn significantly higher amounts, pulling the average up. In my wine dataset example; Concerning the "residual sugar" feature in the dataset, if most wines have low to moderate sugar levels but a few have very high residual sugar, the distribution of residual sugar values would be positively skewed.
# 
# 
# Negative Skew (Left Skew)
# Example: Test scores can sometimes be negatively skewed if a few students perform significantly worse than the rest of the class. In my wine dataset example; Considering the "free sulfur dioxide" levels in the dataset. If most wines have relatively high levels of free sulfur dioxide but a few have significantly low levels, the distribution of free sulfur dioxide values would be negatively skewed.
# 
# 
# Zero Skewness (Symmetrical Distribution)
# Example: Heights of a population often follow a normal distribution, with most people clustered around the average height. In the wine dataset example I got from Kaggle; The "alcohol" content might follow a normal distribution if it is fairly consistent across most wines. If the majority of wines have an alcohol content that clusters around a central value, the distribution may be approximately symmetrical.
# 
# 

# In[7]:


features_df.mean()


# In[16]:


#features_df.mean(axis=1)


# In[8]:


features_df.median()


# In[ ]:





# 

# In[9]:


features_df.mode()


# ## Shape of distribution; Skewness

# In[10]:


charis_wine_skewness = charis_wine.skew()
print(charis_wine_skewness)


# ### Interpretation of skewness results:
# 
# #### Fixed Acidity (0.98): Positively skewed, indicating that most wines have lower fixed acidity, with a few having much higher acidity.
# #### Volatile Acidity (0.67): Also positively skewed, but less than fixed acidity, indicating a concentration of wines with lower volatile acidity.
# #### Citric Acid (0.32): Slightly positively skewed, indicating a mild concentration of lower citric acid values.
# #### Residual Sugar (4.54): Highly positively skewed, suggesting that most wines have low sugar content, while a few have significantly higher sugar levels.
# #### Chlorides (5.68): Very high positive skew, indicating that the majority of wines have low chloride levels, with a few having much higher values.
# #### Free Sulfur Dioxide (1.25): Moderately positively skewed, indicating that most wines contain lower levels of free sulfur dioxide, with some containing higher levels.
# #### Total Sulfur Dioxide (1.52): Moderately Positively skewed, showing a similar pattern to free sulfur dioxide.
# #### Density (0.07): Very close to zero, suggesting it is almost symmetrical.
# #### pH (0.19): Approximately symmetrical, given that 0.19 is very close to zero. This suggests that pH values are fairly evenly distributed around the mean, with only a minimal positive skew. The value is too minor to imply any significant concentration of lower or higher values.
# #### Sulphates (2.43): Positively skewed, indicating most wines have lower sulphate levels.
# #### Alcohol (0.86): Positively skewed, suggesting that most wines have lower alcohol content with some having significantly higher values.
# #### Quality (0.22): Slightly positively skewed, indicating that most wines are rated at lower quality, with a few receiving higher quality scores.

# 
# 
# ## Measures of dispersion
# 
# This tells us how much the data diverges from the typical values

# ### Range 
# 
# The range gives a quick sense of how widely data points are spread out. 
# 
# A large range indicates high variability, meaning that values differ significantly within the dataset. 
# 
# A small range suggests that values are closely clustered and exhibit less variability.
# 
# It can be influenced significantly by outliers or extreme values, which might give a misleading impression of the variability in the data which is why IQR ie the Inter Quartile Range is also measured

# In[12]:


range_values = features_df.max() - features_df.min()
print(range_values)


# Fixed Acidity (11.3): Moderate range, meaning that the wines' fixed acidity levels vary noticeably but not significantly.
# 
# The majority of wines contain comparable levels of volatile acidity with little variation, according to the volatile acidity range (1.46).
# 
# Citric Acid (1.0): Low variance, with a small range; most wines have similar levels of citric acid.
# 
# Some wines are significantly sweeter than others, as indicated by the high range of residual sugar (14.6).
# 
# Chlorides (0.599): Moderate range, indicating some fluctuation in the amount of chloride, but it is still rather little.
# 
# Free Sulphur Dioxide (71.0): Wide range, indicating that there is a significant difference in the quantities of free sulphur dioxide, with some wines having significantly higher concentrations than others.
# 
# There is a wide variation in total sulphur dioxide (283.0), which suggests substantial variability. Some wines have noticeably higher levels of total sulphur dioxide.
# 
# Density (0.01362): Extremely tight range, suggesting virtually no variation in density among the wines, which is normal considering the limited range of density in liquids.
# 
# The pH range of 1.27 is small, meaning that there is little variation in pH levels and that the acidity of most wines is comparable.
# 
# Sulphates (1.67): Moderate range, exhibiting a little but not significantly fluctuating sulphate levels.
# 
# Alcohol (6.5): Moderate range, indicating that different wines have varying amounts of alcohol, some being significantly greater than others.
# 
# 

# In[27]:


# range_values = features_df.quantile(1) - features_df.quantile(0)
# print(range_values)
# This is just another way I used to get the range


# In[13]:


range_of_quality = max(charis_wine["quality"]) - min(charis_wine["quality"])
print(f'Range of quality is: {range_of_quality}')


# In[14]:


features_df.head()


# ## Quartiles
# 
# We already have our range which is the maximum value - minimum value (Where max is features_df.quantile(1) and min is features_df.quantile(0)).
# 
# features_df.quantile(1) gives the 100th percentile (the maximum value) of each feature in your dataset.
# features_df.quantile(0) gives the 0th percentile (the minimum value) of each feature in your dataset.
# 
# Now we would find the upper bound Q3 ie Third quartile and lower bound Q1 ie First quartile of our median. Our median is the same as the 50th percentile (ie features_df.quantile(0.50)) 
# 
# Percentile: Specifically, percentiles divide data into 100 equal parts.
# The 0.00 quantile (0th percentile) is the minimum value.
# The 0.25 quantile (25th percentile) is the first quartile (Q1).
# The 0.50 quantile (50th percentile) is the median.
# The 0.75 quantile (75th percentile) is the third quartile (Q3).
# The 1.00 quantile (100th percentile) is the maximum value.

# In[15]:


third_quartile = features_df.quantile(0.75)
first_quartile = features_df.quantile(0.25)


# ### For Q3 (ie .quantile(0.75))
# These values indicate that 75% of the data are below these values, while 25% of the data are above it.

# In[29]:


print(third_quartile)


# ### For Q1 (ie .quantile(0.25))
# These values indicate that 25% of the data are below these values, while 75% of the data are above it.

# In[30]:


print(first_quartile)


# What I'm saying concerning these quartile is this. Say we have 3 parts of a box A B and C WHERE A and C are 25% and B is 50% so in our box below C is A+B ie 25+50 = 75% and above C is 25%
# 
# and for A 25% on it's side and above it is B and C 50 and 25 respectively. 
# 
# I'll do a box plot below for better understanding and visualization.
# 
# For clarity, A here represents Q1 and B here represents Q2 ie our mediand while C represents our Q3
# 
# 
# For better understanding, say we have scores of students and our q1 is 20 it means that 25% of the data have grades lower than 20 and 75% have grades higher than 20. If Q3 is 64 then 25% of our data had grades higher than 64 while 75 had grades lower than 64 
# 
# That means that 50% of them had grades between 20 and 64 ie our median the Q2

# ## Inter quartile range 
# 
# This measures the spread of the middle 50%. It tells us how spread out the values are
# 
# Although our median and q2 are the same, it's not the same as the iqr ie the inter quartile range.
# IQR just shows the range within which the 50% of our data points lie. That's to say that it shows the spread of the middle half of the dataset and is useful for identifying outliers.

# In[31]:


IQR = third_quartile - first_quartile
print(IQR)


# In[17]:


features_df.describe()
# This will just help us have a better visualization of some of the descriptive statistics in a tabular format


# In[18]:


features_df.var()


# A higher variance indicates that the data points are spread out over a wider range of values, while a lower variance suggests that they are clustered closely around the mean.
# 

# In[19]:


features_df.std()


# A higher standard deviation indicates that the data points are spread out over a wider range, while a lower standard deviation suggests that they are more closely clustered around the mean.
# 

# # Visualisations

# ### Histogram
# 
# A histogram is a graphical representation that organizes a group of data points into specific ranges (bins)

# In[20]:


features_df.hist(bins=15, figsize=(15, 10), layout=(4, 3), color='skyblue')
plt.suptitle('Histograms of Wine Features', fontsize=16)
plt.show()


# In[24]:


features_df.plot(kind='box', figsize=(15, 10), subplots=True, layout=(4, 3), sharex=False, sharey=False)
plt.suptitle('Box Plots of Wine Features', fontsize=16)
plt.show()


# For the box plot I created, the box itself just shows the range where the 50% of the data falls in and the lower end of the box (not in the box but like outside of the box) is the first quartile Q1 and the upper end is the 3rd quartile Q3
# 
# 
# 
# Observations from the Plots:
# 
# Fixed Acidity:
# The box is wide, suggesting a relatively large spread in fixed acidity values.
# There are several outliers, indicating wines with exceptionally high fixed acidity.
# 
# Volatile Acidity:
# The box is narrower than for fixed acidity, meaning less variation in volatile acidity.
# Outliers are present, suggesting some wines with significantly higher volatile acidity.
# 
# Citric Acid:
# The box is relatively short, indicating a narrow range of citric acid values.
# An outlier is present, suggesting a few wines with unusually high citric acid levels.
# 
# Residual Sugar:
# The box is wide, suggesting a large spread in residual sugar content.
# There are several outliers, indicating wines with very high residual sugar.
# 
# Chlorides:
# The box is relatively narrow, indicating a small range of chloride values.
# Outliers are present, suggesting a few wines with unusually high chloride levels and low chloride levels.
# 
# Free Sulfur Dioxide:
# The box is wide, suggesting a large spread in free sulfur dioxide levels.
# Outliers are present, indicating wines with very high free sulfur dioxide.
# 
# Total Sulfur Dioxide:
# The box is wide, suggesting a large spread in total sulfur dioxide levels.
# Outliers are present, indicating wines with very high total sulfur dioxide.
# 
# Density:
# The box is narrow, indicating a small range of density values.
# Outliers are present, suggesting a few wines with unusually high density and low density.
# 
# pH:
# The box is wide, suggesting a large spread in pH values.
# Outliers are present, indicating wines with very high and low pH.
# 
# Sulphates:
# The box is wide, suggesting a large spread in sulphate levels.
# Outliers are present, indicating wines with very high sulphate levels.
# 
# Alcohol:
# The box is wide, suggesting a large spread in alcohol content.
# Outliers are present, indicating wines with very high alcohol content.
# 

# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# # Inferential Statistics

# ### Comparing Quality Ratings Based on Alcohol Content:
# 
# #### Null Hypothesis (H0): There is no difference in the average quality rating of wines with high alcohol content compared to those with low alcohol content.
# 
# #### Alternative Hypothesis (H1): There is a difference in the average quality rating of wines with high alcohol content compared to those with low alcohol content.

# In[90]:


from scipy import stats


alcohol_median = charis_wine["alcohol"].median()
print(f"The median for alcohol is {alcohol_median}")


# #### I divided the wines into 2 groups based on alcohol content, so I can specifically test my hypothesis about whether high and low alcohol content affects the quality ratings of wines.

# In[91]:


high_alcohol_content = charis_wine[charis_wine["alcohol"] > alcohol_median]
low_alcohol_content = charis_wine[charis_wine["alcohol"] <= alcohol_median]

print(f"Number of wines with high alcohol content: {len(high_alcohol_content)}")
print(f"Number of wines with low alcohol content: {len(low_alcohol_content)}")


# In[92]:


t_stat, p_value = stats.ttest_ind(high_alcohol_content['quality'], low_alcohol_content['quality'], equal_var=True)

print(f"T-statistic: {t_stat}, P-value: {p_value}")

alpha = 0.05
if p_value < alpha:
    print("""
    Reject the null hypothesis: There is a significant difference in quality ratings based on alcohol content.
    """)
else:
    print("""
    Fail to reject the null hypothesis: There is no significant difference in quality ratings based on alcohol 
    content.
    """)


# ## Correlation
# 
# A coefficient close to 1 indicates a strong positive correlation (as one variable increases, so does the other).
# A coefficient close to -1 indicates a strong negative correlation (as one variable increases, the other decreases).
# A coefficient around 0 indicates little to no correlation.

# In[28]:


correlation_matrix = charis_wine.corr()
print(correlation_matrix)


# Some Correlations to note
# 
# 
# Quality and Alcohol (0.476166): There is a moderate positive correlation between alcohol content and wine quality. This suggests that wines with higher alcohol content tend to have better quality ratings.
# 
# Quality and Volatile Acidity (-0.390558): This indicates a moderate negative correlation, meaning that as volatile acidity increases, the quality rating tends to decrease. This suggests that wines with higher volatile acidity may be perceived as lower quality.
# 
# Quality and Citric Acid (0.226373): There is a weak positive correlation between quality and citric acid. Higher citric acid levels may contribute to better quality, but the relationship is not strong.
# 
# Density and Alcohol (-0.496180): A strong negative correlation suggests that higher density (which could be influenced by sugar content and alcohol) is associated with lower alcohol levels. This could imply that lower density wines tend to have higher alcohol content.
# 
# pH and Quality (0.205633): This shows a weak positive correlation, indicating that pH levels may have a slight influence on wine quality.

# In[29]:


plt.figure(figsize=(10, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")
plt.title('Correlation Heatmap of Wine Features')
plt.show()


# In[30]:


from scipy.stats import pearsonr

corr, p_value = pearsonr(charis_wine['alcohol'], charis_wine['quality'])
print(f"Correlation between alcohol and quality: {corr}, P-value: {p_value}")


# In[31]:


alcohol_quality_corr = charis_wine['alcohol'].corr(charis_wine['quality'])
print(f"Correlation between alcohol and quality: {alcohol_quality_corr}")


# In[38]:


plt.figure(figsize=(8, 6))
sns.scatterplot(x='alcohol', y='quality', data=charis_wine)
plt.title('Scatter Plot of Alcohol vs. Quality')
plt.xlabel('Alcohol Content')
plt.ylabel('Quality Rating')
plt.axhline(y=charis_wine['quality'].mean(), color='r', linestyle='--', label='Mean Quality')
plt.axvline(x=charis_wine['alcohol'].mean(), color='g', linestyle='--', label='Mean Alcohol')
plt.legend()
plt.show()


# In[ ]:





# ### Predictions and Decision-Making
# ### The above analysis provides a solid foundation for making predictions and informed decisions in wine quality assessment based on the characteristics of the wines.
# 
# 
# 
# ### Predictive Insights: The identified correlation between alcohol and quality can inform winemakers and producers about the potential impact of alcohol content on the perceived quality of their wines. This can guide decisions regarding grape selection, fermentation processes, and marketing strategies.
# 
# 
# 
# ### Targeting Quality Improvements: Understanding that high alcohol content is associated with higher quality ratings can lead to decisions about optimizing alcohol levels during production. If certain levels of alcohol contribute positively to quality, producers might focus on achieving those levels in their products.
# 
# 
# 
# ### Quality Control: The t-test results suggest that wines with low alcohol content may be at a disadvantage regarding perceived quality. Producers could use this information to adjust their processes or blends to ensure that quality remains competitive.
# 
# 
# 
# ### Data-Driven Marketing: Marketers can leverage these insights to emphasize quality attributes related to alcohol content in advertising, targeting consumers who are likely to appreciate higher-quality wines based on alcohol levels.
# 
# 
# 
# ### Future Research and Model Building: The results encourage further exploration into the relationships between other features and quality ratings. This could lead to the development of predictive models (like regression or machine learning models) that can estimate quality based on multiple factors, ultimately helping producers and consumers make better-informed decisions.

# In[ ]:




