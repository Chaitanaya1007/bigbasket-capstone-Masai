# AI Assistance Log

## AI-Assisted Prompt #1 — Monthly Category Revenue SQL

# Role
You are a SQL data analyst helping me complete a BigBasket category performance diagnostic project.

# Context
I am working with the SQLite database `bigbasket_capstone.db`. The database contains `orders` and `products` tables. Masai requires a monthly-by-category business report using Delivered orders only.

# Task
Write a SQLite query that calculates the monthly revenue performance for each product category, including order count, total revenue, and average revenue.

#Constraints
Use SQLite syntax only. Use Delivered orders only. Extract the month using `strftime('%Y-%m', order_date)`. Group the results by category and month and do not modify the underlying database data.

# Format
Return one clearly labelled SQL query with the columns `category`, `month`, `order_count`, `total_revenue`, and `avg_revenue`.

# Verification
I ran the suggested query in DB Browser for SQLite and verified that it executed without errors, returned exactly 36 rows, and produced the required five columns.

________________________________________________________________________________________________

# AI Assistance Log2

## AI-Assisted Prompt #1 — Monthly Category Revenue SQL

### Prompt

I am working on a BigBasket category performance analysis using SQLite. I have `orders` and `products` tables.

Write a SQLite query that calculates monthly revenue performance for each product category using Delivered orders only.

The output must contain:
- category
- month in YYYY-MM format
- order_count
- total_revenue
- avg_revenue

Use `strftime('%Y-%m', order_date)` to extract the month. Group the results by category and month and sort them by category and month.

### How I Used the Output

I used the suggested SQL query as the basis for the monthly category revenue report in Part 1.

### Verification

I ran the query in DB Browser for SQLite and verified that it executed successfully, returned 36 rows, and produced the required five columns.


---

## AI-Assisted Prompt #2 — Python IQR Outlier Detection

### Prompt

I am cleaning a BigBasket orders dataset using Pandas. I need to identify high-side outliers in the `amount_inr` column for Delivered orders.

Show me how to calculate Q1, Q3, IQR, and the upper fence using the standard IQR method:

Upper Fence = Q3 + 1.5 × IQR

Then show me how to count the values above the upper fence and cap those values using Pandas `.clip()` without deleting the original rows.

Do not replace missing values with zero or the mean.

### How I Used the Output

I used the suggested approach to calculate the IQR-based upper fence and created a `capped_amount_inr` column for the subsequent analysis.

### Verification

I ran the code in Google Colab and verified the results.

The analysis produced:

- Q1 = ₹90
- Q3 = ₹275
- IQR = ₹185
- Upper Fence = ₹552.50
- High-side outliers = 16

The 16 outlier values were capped rather than removed from the dataset.