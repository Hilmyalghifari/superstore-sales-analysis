# Superstore Sales Analysis

An end-to-end Data Analyst portfolio project focused on analyzing retail sales performance, profitability, product categories, customer segments, and regional business performance using Python, SQL, and Microsoft Excel.

## Project Overview

This project analyzes the Sample Superstore dataset to identify business trends, evaluate sales and profitability, and uncover insights that can support data-driven business decisions.

The analysis follows an end-to-end workflow, starting from data cleaning and exploratory data analysis (EDA), followed by SQL-based business analysis, and finishing with an interactive Excel dashboard.

## Objectives

- Analyze overall sales and profit performance.
- Identify yearly and monthly sales trends.
- Evaluate product category and sub-category performance.
- Analyze the relationship between discount levels and profitability.
- Compare business performance across regions.
- Understand customer segment contributions.
- Evaluate shipping methods and shipping duration.
- Present key business insights through an interactive dashboard.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and exploratory data analysis |
| Pandas | Data manipulation and analysis |
| Matplotlib / Seaborn | Data visualization |
| MySQL | SQL-based business analysis |
| phpMyAdmin | Database management and SQL execution |
| Laragon | Local development environment |
| Microsoft Excel 365 | Interactive dashboard and visualization |

## Dataset

- **Dataset:** Sample Superstore
- **Total Records:** 9,994 rows
- **Original Columns:** 21
- **Final Columns:** 22
- **Data Period:** January 2014 – December 2017

The dataset contains information about orders, customers, products, sales, discounts, profits, regions, and shipping methods.

## Project Workflow

### 1. Data Cleaning & Preparation — Python

Data preparation was performed using Python and Pandas.

Key activities:
- Checked and handled missing values.
- Identified duplicate records.
- Converted date columns into datetime format.
- Converted Postal Code into string format.
- Validated shipping dates.
- Checked invalid quantity, sales, and discount values.
- Created a new `Shipping Duration` column.

**Final dataset:** 9,994 rows and 22 columns.

Negative profit values were retained because they represent actual business losses rather than invalid records.

### 2. Exploratory Data Analysis (EDA) — Python

Performed exploratory analysis to understand business performance and identify initial patterns.

Analysis included:
- Overall business performance.
- Monthly and yearly sales trends.
- Category and sub-category performance.
- Discount analysis.
- Regional performance.
- Customer segment analysis.
- Shipping performance.

### 3. SQL Business Analysis — MySQL

Imported the cleaned dataset into MySQL and performed business-focused