# Load the ggplot2 library
library(ggplot2)

# 1. Define your model coefficients
b0 <- 10.003728 # Intercept
b1 <- -2.008372 # temperature
b2 <- 0.30266   # hasDam
b3 <- -4.039212  # temperature:hasDam

# 2. Create a grid of data to predict on
#    (Assuming a temperature range from 5 to 15)
plot_data <- expand.grid(
  temperature = seq(from = 5, to = 15, by = 0.5),
  hasDam = c(0, 1)
)

# 3. Calculate the predicted salmonDensity using the model equation
plot_data$predicted_density <- b0 + 
  (b1 * plot_data$hasDam) + 
  (b2 * plot_data$temperature) + 
  (b3 * plot_data$hasDam * plot_data$temperature)

# 4. Convert hasDam to a descriptive factor for the legend
plot_data$DamStatus <- factor(
  plot_data$hasDam,
  levels = c(0, 1),
  labels = c("Free-flowing", "Dam upstream")
)

# 5. Create the plot
ggplot(plot_data, aes(x = temperature, y = predicted_density, color = DamStatus, linetype = DamStatus)) +
  geom_line(linewidth = 1.2) + # Draw the lines
  labs(
    title = "Interaction Effect of Temperature and Dams on Salmon Density",
    x = "Water Temperature",
    y = "Predicted Salmon Density",
    color = "River Status",  # Legend title for color
    linetype = "River Status" # Legend title for linetype
  ) +
  theme_minimal() + # A clean theme
  scale_color_manual(values = c("Free-flowing" = "blue", "Dam upstream" = "red")) +
  scale_linetype_manual(values = c("Free-flowing" = "dashed", "Dam upstream" = "solid"))