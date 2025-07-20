# ===============================================
# FitBite - Healthy Meal Subscription Segmentation
# Customer Segmentation using K-Means Clustering

library(tidyverse)
library(ggplot2)
library(cluster)
library(factoextra)
library(reshape2)

# ---------- Simulate Customer Data ----------
set.seed(123)
n <- 200

fitbite_data <- tibble(
  CustomerID = 1:n,
  AvgWeeklyOrders = rpois(n, lambda = 5),
  AvgMonthlySpend = round(rnorm(n, mean = 2500, sd = 500), 2),
  SubscriptionType = sample(c("Basic", "Premium", "Flex"), n, replace = TRUE),
  PreferredDiet = sample(c("Keto", "Vegan", "Balanced", "High-Protein"), n, replace = TRUE),
  EngagementChannel = sample(c("Mobile App", "Website", "Phone Support"), n, replace = TRUE),
  SubscriptionDuration = sample(1:24, n, replace = TRUE)
)

# ---------- Encode Categorical Variables ----------
fitbite_encoded <- fitbite_data %>%
  mutate(
    SubscriptionType = as.numeric(factor(SubscriptionType)),
    PreferredDiet = as.numeric(factor(PreferredDiet)),
    EngagementChannel = as.numeric(factor(EngagementChannel))
  )

# ---------- Select Numeric Variables and Scale ----------
fitbite_numeric <- fitbite_encoded %>%
  select(AvgWeeklyOrders, AvgMonthlySpend, SubscriptionType,
         PreferredDiet, EngagementChannel, SubscriptionDuration)

fitbite_scaled <- scale(fitbite_numeric)

# ---------- Determine Optimal Clusters ----------
print(
  fviz_nbclust(fitbite_scaled, kmeans, method = "wss") +
    theme_minimal() +
    labs(title = "Elbow Method for Optimal Clusters")
)

# ---------- Apply K-Means Clustering ----------
set.seed(123)
kmeans_result <- kmeans(fitbite_scaled, centers = 4)

# Add numeric and descriptive segment labels
fitbite_data$SegmentNum <- kmeans_result$cluster
segment_labels <- c("Loyal Protein Fans", "Trial Users", "Keto Champions", "Budget Seekers")
fitbite_data$Segment <- factor(fitbite_data$SegmentNum, levels = 1:4, labels = segment_labels)

# ---------- Cluster Visualization (Scatter Plot) ----------
print(
  ggplot(fitbite_data, aes(x = AvgWeeklyOrders, y = AvgMonthlySpend, color = Segment)) +
    geom_point(size = 3, alpha = 0.8) +
    theme_minimal() +
    labs(
      title = "FitBite Customer Segments",
      x = "Weekly Orders",
      y = "Monthly Spend (INR)",
      color = "Customer Segment"
    ) +
    scale_color_manual(values = c(
      "Loyal Protein Fans" = "#1f77b4",
      "Trial Users" = "#ff7f0e",
      "Keto Champions" = "#2ca02c",
      "Budget Seekers" = "#d62728"
    ))
)

# ---------- Bar Chart: Avg Spend by Segment ----------
print(
  ggplot(fitbite_data, aes(x = Segment, y = AvgMonthlySpend, fill = Segment)) +
    stat_summary(fun = mean, geom = "bar", width = 0.6) +
    labs(title = "Average Monthly Spend by Segment", y = "INR", x = "") +
    theme_minimal() +
    theme(legend.position = "none") +
    scale_fill_manual(values = c(
      "Loyal Protein Fans" = "#1f77b4",
      "Trial Users" = "#ff7f0e",
      "Keto Champions" = "#2ca02c",
      "Budget Seekers" = "#d62728"
    ))
)

# ---------- Bar Chart: Avg Weekly Orders by Segment ----------
print(
  ggplot(fitbite_data, aes(x = Segment, y = AvgWeeklyOrders, fill = Segment)) +
    stat_summary(fun = mean, geom = "bar", width = 0.6) +
    labs(title = "Average Weekly Orders by Segment", y = "Orders", x = "") +
    theme_minimal() +
    theme(legend.position = "none") +
    scale_fill_manual(values = c(
      "Loyal Protein Fans" = "#1f77b4",
      "Trial Users" = "#ff7f0e",
      "Keto Champions" = "#2ca02c",
      "Budget Seekers" = "#d62728"
    ))
)

# ---------- Segment Summary ----------
segment_summary <- fitbite_data %>%
  group_by(Segment) %>%
  summarise(
    AvgOrders = round(mean(AvgWeeklyOrders), 1),
    AvgSpend = round(mean(AvgMonthlySpend), 1),
    AvgDuration = round(mean(SubscriptionDuration), 1),
    TopDiet = names(sort(table(PreferredDiet), decreasing = TRUE)[1])
  )

print(segment_summary)
