# Urban Threads – Q4 2024 Order & Return Rate Analysis

## Project Overview

This project analyzes Q4 2024 order and return data for Urban Threads, a direct-to-consumer fashion brand operating in India. The objective was to investigate the increase in return rate from 12% to 19% and identify the operational, customer, and channel-level drivers behind this shift.

The broader business problem is clear:
Rising return rates are directly impacting profitability through reverse logistics, restocking costs, refund processing, and lost inventory value. The leadership team wants to reduce the return rate below 15% within two quarters without materially hurting sales.

This project simulates real operational analytics work and focuses on translating raw transactional data into actionable business recommendations.

## Business Objectives

1. Identify drivers of the increased return rate.

2. Determine whether specific customer segments, product categories, or order sources are disproportionately contributing.

3. Evaluate the impact of Diwali promotions and heavy discounting.

4. Provide actionable recommendations to reduce returns while preserving revenue growth.

## Project Structure

The submission consists of:

1. Excel File

2. Cleaning Log

3. Validation Summary

4. Analysis Tabs

5. KPI Calculations

6. Power BI Dashboard

7. Visualizations

8. Key Findings

9. Recommendations

10. Assumptions & Limitations

## 1) Data Cleaning & Preparation

The first step was ensuring analytical integrity. Rather than modifying raw data directly, a structured cleaning and validation workflow was followed.

Why This Was Necessary

Poor data quality leads to incorrect business decisions. In an operational setting, even a 1–2% misclassification in returns or revenue can materially distort profitability analysis.

### Key Cleaning Actions
### Missing Value Analysis

Delivery date nulls (5%) were validated against cancelled and RTO orders.

Return reason nulls (48%) were expected when return_initiated = "No".

Ensured missingness aligned with business logic rather than data errors.

### Format Standardization

Corrected inconsistent labels (e.g., “Delievered” → “Delivered”).

Standardized SKU formats.

Verified date formats across order, delivery, and return dates.

### Outlier Identification

Flagged negative quantity (-1) case.

Verified discount percent within 0–100 range.

Checked for unreasonable price or order total values.

### Logical Data Validation

Custom validation columns were created to test:

Delivery date ≥ Order date

Return received ≥ Delivery date

Delivery status vs. delivery date consistency

Return logic cross-field consistency

This ensured operational metrics such as return rate and delivery time were calculated on reliable data.

## 2) Data Validation & Quality Checks

Formal validation rules were implemented both in Excel (Power Query) and SQL.

Examples:

Order ID format validation (UT-XXXXXX)

Q4 date boundary checks (Oct 1 – Dec 31, 2024)

Quantity must be positive integer

Discount percent within bounds

Delivery status and return consistency

RTO orders logically cannot have returns initiated

All validation checks returned compliant results after cleaning.

The purpose of this stage was to simulate production-level data reliability before performing any business analysis.

## 3) KPI & Performance Analysis
### Core KPIs Calculated

Gross Merchandise Value (GMV)

Net Revenue

Average Order Value (AOV)

Overall Return Rate

RTO Rate

Refund Processing Rate

First-Time Buyer Return Rate

Repeat Buyer Return Rate

Fulfillment Split by Warehouse

These KPIs were calculated to quantify operational efficiency, profitability, and customer behavior.

## 4) Dashboard Design & Visualization Rationale

### Report Snapshot (Power BI DESKTOP)

![Dashboard_upload]()


The dashboard was built not for decoration, but to answer specific business questions raised

Each chart was selected intentionally based on analytical suitability.

### 1. Weekly Order Volume vs. Return Rate (Dual-Axis Line Chart)

Why this chart?
A dual-axis line chart is appropriate because it allows comparison of two time-series metrics with different scales: order volume and return rate.

### Business Question Addressed:

Did return rates lag behind order spikes (e.g., Diwali)?

Did promotional activity increase low-quality orders?

### Insight Delivered:

A noticeable spike during Diwali week.

Return rates lagged 2–3 weeks behind order spikes.

Heavy discounting did not strongly correlate with higher return rates.

This chart helps leadership assess whether growth campaigns are damaging order quality.

### 2. Return Rate by Product Category (Bar Chart with Benchmark Line)

Why this chart?
Bar charts are best for categorical comparisons. The benchmark line (overall return rate) helps instantly identify outliers.

### Business Question Addressed:

Which categories are driving returns?

Is the problem concentrated or broad-based?

### Insight Delivered:

Outerwear had the highest return rate.

It was not the lowest-volume segment, making it financially significant.

Accessories had low return rates.

This visualization supports targeted operational intervention instead of broad policy changes.

### 3. Return Reasons Breakdown (Donut Chart)

Why this chart?
Since there were fewer than five major categories, a donut chart was used to show proportion contribution clearly.

### Business Question Addressed:

Are returns due to operational issues or customer preference?

### Insight Delivered:

Size issues dominate return reasons.

Quality defect and wrong item represent operational control issues.

Changed mind is customer-driven behavior.

This distinction informs whether improvements should focus on product quality, fulfillment accuracy, or sizing experience.

### 4. Customer Type × Order Source Matrix

### Why this chart?
A grouped bar/heatmap allows cross-segmentation comparison, which simple bar charts cannot show clearly.

### Business Question Addressed:

Are certain combinations high-risk (e.g., New + Instagram)?

### Insight Delivered:

New customers have significantly higher return rates than returning customers.

Instagram sources higher return rates but remains revenue-positive.

This prevents oversimplified decisions such as shutting down a channel without context.

### 5. COD vs Prepaid – Return & RTO Comparison (Grouped Bar Chart)

### Why this chart?
Grouped bars allow direct side-by-side comparison of risk metrics.

### Business Question Addressed:

Is COD financially risky?

Should COD availability be reduced?

### Insight Delivered:

COD had elevated RTO rates.

Not the highest return rate, but operationally riskier.

Suggests selective restrictions rather than full removal.

## 5) Key Business Insights
### 1. Customer Risk Segmentation

Returning customers: Lower return rate (~10%)

New customers: Higher return rate (~28%)

New customers represent higher operational risk but are necessary for growth. The focus should shift toward better onboarding and sizing support.

### 2. Size Issue as Primary Driver

If ~45% of returns cite size issues:

Improve size charts.

Introduce fit comparison tools.

Collect structured post-purchase fit feedback.

This is a controllable problem.

### 3. Instagram Shop Decision

Despite higher return rates:

Contributes significant revenue.

Sources new customers.

Higher AOV observed.

Conclusion: Do not shut down. Instead:

Adjust product mix.

Reduce heavy discounting.

Consider COD restrictions for new users.

### 6. Recommendations to Reduce Return Rate Below 15%

Improve sizing tools and introduce fit guidance.

Restrict COD for high-risk segments (e.g., New + Instagram).

Improve quality control for outerwear category.

Implement post-delivery engagement to reduce impulse returns.

### Estimated Impact:
A 3–4% reduction from sizing improvements alone could significantly close the gap toward the 15% target.

### Assumptions & Limitations

No historical pre-Q4 data available for trend comparison.

No customer-level lifetime value analysis possible.

No cost-level breakdown of reverse logistics per segment.

### Future analysis should incorporate:

Customer LTV modeling

Cohort retention analysis

Return cost modeling by category

### Why This Project Matters

This project demonstrates the ability to:

Clean messy operational data responsibly

Validate business logic across multiple fields

Connect return behavior to profitability

Design visualizations that answer executive questions

Provide structured, measurable recommendations

The goal was not just to compute metrics, but to bridge the gap between analytics and operational decision-making.
