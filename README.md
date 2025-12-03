## Pharmacokinetic Drug Concentration Analysis (R Programming Project)

This project analyzes the Theoph dataset, a pharmacokinetic dataset included in R. The analysis explores drug absorption, peak plasma concentration, and elimination patterns using statistical summaries and custom visualization functions.

## 📌 Project Objectives

Count unique subjects and records

Analyze weight and dosage distributions

Create a normalized concentration variable

Compute mean normalized concentration per time point

Visualize pharmacokinetic behavior

Study weight–dose relationship

## 🛠 Technologies Used

R

Base R functions

tidyverse (optional)

randomcoloR

ggplot2 (optional)

## 📊 Key Steps & Methods
✔ Subject & Record Summary

Counted unique subjects

Number of rows

Weight categories

Unique doses

✔ Normalized Concentration Calculation
norm_conc <- (Theoph$conc / max(Theoph$conc)) * Theoph$conc

✔ Time-Point Average Concentrations

Created a loop to compute mean normalized concentration for each time point.

✔ Custom Bar Plot Function
PlotBarPlot <- function(x, y, type) {
  n <- length(x)
  palette <- distinctColorPalette(n)
  barplot(height = y, col = palette,
          main = paste("Mean Normalized Concentration - ", type),
          xlab = "Timepoints", ylab = "Normalized Concentration")
}

✔ Weight–Dose Analysis

Created groups:

≤55

55–65

65–75

75+

Found inverse dose–weight relationship.

## 📈 Results Summary

Concentration rises → peaks → declines

Pattern matches pharmacokinetic absorption & elimination

Weight affects dosage patterns

Time-based normalization highlights drug behavior

Variability suggests differences in metabolism among subjects
(See full report for images and interpretations.)

## 📄 Full Report

The PDF (Project1.pdf) includes all results, visualizations, and explanations.

## 👤 Author

Pratik Harlikar
Master of Data Analytics — NMSU
R Programming | Data Analysis | Visualization
