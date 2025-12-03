# Purpose of the project: Midterm Project for R Programming
# Created by: Pratik Harlikar
# Created on: 03-19-2025

# Load the required dataset
library(datasets)
data(Theoph)
str(Theoph)  
head(Theoph) 

#______________________________________________________________________________

# Question 1)

# 1a: How many unique 'Subjects' are in the data frame?

num_unique_subjects <- length(unique(Theoph$Subject))
cat("Number of unique subjects:", num_unique_subjects, "\n")

# 1b) What is the total number of records (rows)?

num_records <- nrow(Theoph)
cat("Total number of records:", num_records, "\n")

# 1c) How many records are there per 'Subject'?

records_per_subject <- table(Theoph$Subject)
cat("Records per Subject:\n")
print(records_per_subject)

# 1d) List the unique weights ('Wt') in the data frame

unique_weights <- unique(Theoph$Wt)
cat("Unique weights:\n")
print(unique_weights)

# 1e) List the unique dosages ('Dose') in the data frame

unique_doses <- unique(Theoph$Dose)
cat("Unique dosages:\n")
print(unique_doses)

#______________________________________________________________________________

# Question 2)

norm_conc <- (Theoph$conc / max(Theoph$conc)) * Theoph$conc
Theoph$norm_conc <- norm_conc
head(Theoph)

#______________________________________________________________________________

# Question 3)

install.packages("randomcoloR")  
library(randomcoloR)

Theoph$norm_conc <- (Theoph$conc / max(Theoph$conc)) * Theoph$conc
unique_timepoints <- sort(unique(Theoph$Time))
mean_norm_conc <- numeric(length(unique_timepoints))

for (i in seq_along(unique_timepoints)) {
  mean_norm_conc[i] <- mean(Theoph$norm_conc[Theoph$Time == unique_timepoints[i]])
}
names(mean_norm_conc) <- unique_timepoints

PlotBarPlot <- function(x, y, type) {
  n <- length(x)
  palette <- distinctColorPalette(n)
  barplot(height = y, width = 3, space = 1, names.arg = x,
          col = palette, axes = TRUE,
          main = paste("distribution of dose conc. using ", type, sep = ""),
          xlab = "Timepoints", ylab = "Dose conc.")
}

pdf("mean_norm_conc_plot.pdf")
PlotBarPlot(x = unique_timepoints, y = mean_norm_conc, type = "mean")
dev.off()

result_table <- data.frame(Time = unique_timepoints, Mean_Norm_Conc = mean_norm_conc)
print(result_table)

# Add a short explanation:
cat("\nInterpretation of the plot:\n")
cat("The normalized concentration generally increases in the early timepoints,\n")
cat("reaches a peak, and then gradually decreases over time.\n")
cat("This indicates drug absorption followed by metabolism and elimination.\n")

#______________________________________________________________________________

# Question 4)

wt_categories <- c("<=55", ">55 and <=65", ">65 and <=75", ">75")

mean_dose_55 <- mean(Theoph$Dose[Theoph$Wt <= 55])
mean_dose_55_65 <- mean(Theoph$Dose[Theoph$Wt > 55 & Theoph$Wt <= 65])
mean_dose_65_75 <- mean(Theoph$Dose[Theoph$Wt > 65 & Theoph$Wt <= 75])
mean_dose_75 <- mean(Theoph$Dose[Theoph$Wt > 75])
weight_dose_table <- data.frame(
  "Weight range" = wt_categories,
  "Mean of dose" = c(mean_dose_55, mean_dose_55_65, mean_dose_65_75, mean_dose_75)
)

print(weight_dose_table)

# Conclusion: The average dose decreases as the subject's weight increases. 
This suggests that subjects with lower body weight receive relatively higher doses, 
and those with higher body weight receive lower doses on average. This inverse 
relationship might reflect dosage adjustments based on body mass.

#______________________________________________________________________________








