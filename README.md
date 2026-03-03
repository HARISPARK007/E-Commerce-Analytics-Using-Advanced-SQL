E-Commerce SQL Analytics Project
Data Engineering Internship | Week 1 & Week 2
Project Overview

This project simulates a real-world e-commerce analytics environment where transactional data is transformed into business insights using structured SQL techniques.

The project was completed in two phases:

Week 1: Schema design, relational modeling, and foundational reporting

Week 2: Advanced analytics including RFM scoring, cohort retention, churn segmentation, product intelligence, and sales performance analysis

The objective was to build a production-ready relational schema and implement layered analytical queries using advanced SQL concepts.

Database Design (Week 1)

 Core Tables Created

customers

products

orders

order_items

Key Features

Primary and Foreign Key constraints

Referential integrity enforcement

Realistic synthetic data (100+ records per table)

Proper normalization of transactional structure

Advanced Schema Extension (Week 2)

Additional tables were integrated into the existing production schema:

returns

promotions

order_promotions

product_inventory

Each table:

References existing keys via foreign constraints

Contains 100+ realistic records

Supports non-trivial analytical reporting

Maintains data integrity across relationships

Analytical Themes Covered

1️⃣ Customer Analytics

Monthly Revenue Trend with MoM % Change

RFM Customer Scoring (Recency, Frequency, Monetary)

Customer Cohort Retention Analysis

First vs Repeat Purchase Revenue Split

Customer Churn Risk Segmentation

Business Questions Answered:

Are we growing month-over-month?

Which customers are most valuable?

How well do customers retain over time?

Are repeat customers driving revenue?

Who is at risk of churn?

2️⃣ Product & Inventory Intelligence

Product Margin Ranking by Category

Low-Stock & Restock Alert Reporting

Return Rate by Product and Category

Top & Bottom Products by Net Revenue (after refunds)

Business Questions Answered:

Which products generate the highest margin?

Where are we at risk of stockouts?

Which products have quality or return issues?

What is the true profitability after refunds?

3️⃣ Sales Performance & Promotions

Promotion Effectiveness Analysis

Weekly Sales Heatmap (Week x Day)

Category Revenue Breakdown with Subtotals (ROLLUP)

Business Questions Answered:

Do promotions increase average order value?

Which days and weeks drive peak revenue?

Which categories contribute most to overall revenue?

SQL Concepts & Learning Outcomes

This project strengthened my understanding of:

🔹 Core SQL

SELECT, WHERE, GROUP BY, HAVING

JOIN strategies (INNER, LEFT)

Aggregations and filtering

🔹 Intermediate & Advanced SQL

Common Table Expressions (CTEs)

Window Functions (LAG, RANK, ROW_NUMBER, NTILE)

Cohort logic using date arithmetic

Conditional aggregation (CASE WHEN)

RFM scoring methodology

Churn segmentation logic

ROLLUP for subtotal reporting

Revenue growth percentage calculations

🔹 Analytical Thinking

Converting business questions into SQL logic

Structuring multi-layered query pipelines

Breaking complex problems into readable CTE layers

Designing reports for decision-making rather than raw output


📂  Project Structure

ecommerce-sql-analytics/
│
├── database/
│   ├── 01_schema.sql
│  
├── reports/
│   ├── week1_reports.sql
│   ├── week2_reports.sql
│
├── results/
│   ├── Task1_result.pdf
│   ├── Task2_result.pptx
│
└── README.md
