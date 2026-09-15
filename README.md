# BigBasket Category Performance Diagnostic

## 1. Project Overview

This project looks at BigBasket's category-level sales performance using SQL, spreadsheets, Tableau, and Python.

The main idea was to take the order data, clean and analyze it, compare category revenue with business targets, and then turn the results into a dashboard and a short data story.

The project covers the complete analytics workflow, starting from the raw data and ending with business recommendations.

---

## 2. Business Objective

The main objective of the project is to understand how different product categories are performing against their revenue targets.

The analysis focuses on:

- Category-wise revenue performance
- Monthly revenue trends
- Delivered order performance
- Average Order Value
- Revenue target achievement
- Supplier performance
- Data quality issues such as duplicates, missing values, and outliers

---

## 3. Dataset

The project uses three main data tables/files.

### Orders

`orders_raw.csv`

Contains order-level information including:

- Order ID
- Customer ID
- Product ID
- Order Date
- City
- Quantity
- Amount
- Payment Mode
- Order Status
- Rating

### Products

`products.csv`

Contains product information including:

- Product ID
- Product Name
- Category
- Supplier

### Category Targets

The project also uses category-level revenue targets provided as part of the project requirements.

---

# 4. Part 1 — SQL Analysis

SQLite was used to create and analyze the BigBasket database.

The SQL work was divided into three files.

### `01_foundations.sql`

This file covers the basic SQL analysis, including:

- `WHERE`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`
- Aliases using `AS`
- `IN`
- `BETWEEN`
- `NOT BETWEEN`
- `IS NULL`

### `02_aggregation_joins.sql`

This file covers:

- `INNER JOIN`
- `LEFT JOIN`
- `GROUP BY`
- Aggregations such as `COUNT`, `SUM`, and `AVG`
- `HAVING`

The analysis was used to compare category-level order counts and revenue and to identify products with no orders.

### `03_reporting.sql`

This file contains the main business reporting queries.

It includes:

- Product revenue tiering using `CASE WHEN`
- Monthly revenue by category
- Category-level revenue target variance
- Percentage variance
- Target status classification

### SQL Output

The monthly category revenue report was exported as:

`monthly_category_revenue.csv`

This file is also used in the spreadsheet and Tableau analysis so that the same dataset is carried through the different stages of the project.

---

# 5. Part 2 — Spreadsheet Analysis

The SQL output was further analyzed using Google Sheets.

The spreadsheet contains:

- Monthly Data
- Category Targets
- Pivot Table
- Category Summary

The spreadsheet analysis compares actual category revenue with the target revenue and calculates:

- Revenue variance
- Percentage variance
- Target status
- SQL result matching

The final workbook is available as:

`spreadsheet_workbook.xlsx`

---

# 6. Part 3 — Tableau Dashboard

An interactive Tableau Public dashboard was created using the same `monthly_category_revenue.csv` file.

The dashboard includes:

### KPI Cards

- Total Revenue — **₹88,282**
- Total Delivered Orders — **434**
- Average Order Value — approximately **₹203.41**
- Categories Meeting Target — **3**

### Visualizations

- Monthly Revenue Trend
- Category Revenue Comparison
- Target Status classification
- Interactive Category filter

### Tableau Public Dashboard

[View the BigBasket Category Performance Dashboard](https://public.tableau.com/app/profile/chaitanaya.sharma/viz/BigbasketCategoryPerformanceDiagnostic/BIGBASKETCATEGORYPERFORMANCEDIAGNOSTIC)

The dashboard is published publicly on Tableau Public.

---

# 7. Part 4 — Python & Pandas Analysis

Python and Pandas were used to work with the raw order data and perform a separate cleaning and analysis workflow.

The main steps were:

### Data Inspection

The raw dataset was inspected for:

- Number of rows and columns
- Data types
- Missing values
- Order status distribution
- Potential data quality issues

### Duplicate Removal

Duplicate `order_id` records were identified and removed while keeping the first occurrence.

The dataset went from **508 rows to exactly 500 unique orders**.

### Text Cleaning

Whitespace and inconsistent casing were cleaned in the city and category columns using:

- `.str.strip()`
- `.str.title()`

### Missing Values

Missing `amount_inr` values were kept as missing because their actual revenue was unknown.

Missing ratings were also kept as missing because ratings were not recorded for non-Delivered orders.

### Outlier Detection

High-side outliers were identified using the IQR method.

The results were:

- Q1 = **₹90**
- Q3 = **₹275**
- IQR = **₹185**
- Upper Fence = **₹552.50**
- Outliers above the fence = **16**

The outliers were capped rather than deleted.

### Feature Engineering

The following columns were created:

- `month`
- `month_name`
- `revenue_per_unit`
- `is_delivered`

### Business Analysis

The cleaned dataset was merged with the products data using `product_id`.

The analysis found:

- Highest-revenue category: **Household Essentials — ₹20,910**
- Lowest-revenue category: **Fruits & Vegetables — ₹9,170**
- Highest-revenue supplier: **HomeEssentials Traders — ₹20,910**
- Highest-revenue month: **May — ₹16,668.50**

The Python analysis is available in:

`analysis.ipynb`

---

# 8. Key Findings

A few results stood out from the analysis:

1. **Household Essentials** was the strongest category in the cleaned Python analysis, generating **₹20,910**.

2. **Fruits & Vegetables** had the lowest cleaned revenue at **₹9,170**.

3. **HomeEssentials Traders** was the highest-revenue supplier at **₹20,910**.

4. **May** recorded the highest monthly revenue in the cleaned dataset at **₹16,668.50**.

5. In the target analysis, **3 out of 6 categories** were above their revenue targets.

---

# 9. Data Story

The target analysis showed a clear split between the categories.

### Above Target

- Household Essentials — **₹4,715 above target**
- Bakery — **₹3,410 above target**
- Personal Care — **₹882 above target**

### Below Target

- Dairy & Eggs — **₹2,410 below target**
- Fruits & Vegetables — **₹2,210 below target**
- Snacks & Beverages — **₹2,105 below target**

The two critical categories, Fruits & Vegetables and Snacks & Beverages, had a combined shortfall of **₹4,315**.

The detailed data story and recommendations are available in:

`DATA_STORY.md`

---

# 10. Recommendations

Based on the analysis, two main recommendations were identified:

### 1. Focus on the critical categories

Fruits & Vegetables and Snacks & Beverages are both classified as **Below Target - Critical**.

Their combined shortfall is **₹4,315**, making these the main categories that need improvement.

### 2. Maintain the strongest categories

Household Essentials and Bakery are performing significantly above their targets.

Together, they are **₹8,125 above their combined targets**, so maintaining their current performance should remain a priority.

---

# 11. Repository Structure

```text
bigbasket-capstone/
│
├── bigbasket_capstone.db
├── orders_raw.csv
├── products.csv
│
├── verify.sql
├── 01_foundations.sql
├── 02_aggregation_joins.sql
├── 03_reporting.sql
├── monthly_category_revenue.csv
│
├── spreadsheet_workbook.xlsx
├── analysis.ipynb
│
├── DATA_STORY.md
├── ai_log.md
└── README.md