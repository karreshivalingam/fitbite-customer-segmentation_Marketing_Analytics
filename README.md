# fitbite-customer-segmentation_Marketing_Analytics

# 🥗 FitBite Customer Segmentation Project

This project focuses on applying **K-Means Clustering** to segment customers of a fictional healthy meal subscription service called **FitBite**. The goal is to identify distinct customer groups based on their purchase behavior and preferences and suggest tailored marketing strategies.

---

## 📌 Project Objective

To simulate realistic customer data and use a clustering algorithm to:
- Segment FitBite’s customers into actionable groups
- Visualize these segments using meaningful plots
- Provide data-driven marketing strategy recommendations

---

## 🛠️ Tools & Libraries Used

- `R`, `ggplot2`, `dplyr`, `tidyr`, `cluster`, `factoextra`, `reshape2`

---

## 📊 Simulated Features

- `AvgWeeklyOrders`: Number of weekly meals ordered
- `AvgMonthlySpend`: Total monthly spend in INR
- `SubscriptionType`: Basic / Premium / Flex
- `PreferredDiet`: Keto / Vegan / Balanced / High-Protein
- `EngagementChannel`: Mobile App / Website / Phone Support
- `SubscriptionDuration`: Number of months subscribed

A total of **200 customers** were simulated for the analysis.

---

## 🧪 Clustering Technique: K-Means

1. **Data Preparation**:
   - Categorical variables encoded using `as.numeric(factor())`
   - Features scaled using `scale()`

2. **Elbow Method**:
   - Used `fviz_nbclust()` to determine the optimal number of clusters
   - Chose **k = 4** as the ideal number of clusters

3. **Cluster Labels**:
   The 4 customer segments were labeled for interpretation:
   - **Loyal Protein Fans**
   - **Trial Users**
   - **Keto Champions**
   - **Budget Seekers**

---

## 📈 Visualizations

### 🔹 1. Customer Segmentation Scatter Plot
Shows the relationship between **Weekly Orders** and **Monthly Spend**, colored by segment.

![Cluster Scatter](plots/Avg weekly orders.png)

---

### 🔹 2. Average Monthly Spend by Segment

Displays the spending behavior of each customer group.

![Avg Spend](plots/fitbite_avg_monthly_spend.png)

---

### 🔹 3. Average Weekly Orders by Segment

Highlights the frequency of engagement from each cluster.

![Avg Orders](plots/fitbite_avg_weekly_orders.png)

---

## 📋 Segment Summary

| Segment             | Avg Orders | Avg Spend | Avg Duration | Top Diet     |
|---------------------|------------|-----------|--------------|--------------|
| Loyal Protein Fans  | High       | High      | Long         | High-Protein |
| Trial Users         | Low        | Low       | Short        | Balanced     |
| Keto Champions      | Medium     | Medium    | Medium       | Keto         |
| Budget Seekers      | Medium     | Low       | Medium       | Vegan        |

*(Exact values available in the script via `segment_summary`)*

---

## 🎯 Targeted Marketing Strategies

| Segment             | Strategy Recommendation                                                           |
|---------------------|------------------------------------------------------------------------------------|
| **Loyal Protein Fans**  | Introduce a referral-based loyalty program and premium bundles                   |
| **Trial Users**         | Send onboarding offers, discounts, and educational content to increase loyalty  |
| **Keto Champions**      | Launch diet-specific campaigns with community engagement and recipes            |
| **Budget Seekers**      | Promote budget-friendly meal packs and flexible subscription options            |

---

## 📂 Project Files

- `fitbite_segmentation.R`: R script with data simulation, clustering, and plots
- `FitBite_Segmentation_Report.pdf`: Final PDF report (if available)
- `plots/`: Folder containing all visualizations (saved as `.png`)

---

## 📌 Key Learnings

- Simulated data can reveal powerful insights with the right analytical approach
- K-Means clustering is effective for behavior-based segmentation
- Visual analytics helps make marketing decisions more intuitive and impactful

---

## 🔗 Connect With Me

If you liked this project or have feedback, feel free to connect!

> ✅ Ready to use in your [LinkedIn post](https://linkedin.com)  
> 🔁 Fork or star the repo to show support!

---

