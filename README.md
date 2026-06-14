# AWS Sales Analytics Pipeline

## Project Overview

This project demonstrates an end-to-end AWS Data Engineering pipeline for retail sales analytics using Amazon S3, AWS Glue Crawlers, AWS Glue Data Catalog, and Amazon Athena.

The pipeline ingests CSV sales data into Amazon S3, automatically discovers schema using AWS Glue Crawlers, catalogs metadata in the Glue Data Catalog, and performs serverless SQL analytics using Amazon Athena.

This project focuses on foundational cloud data engineering concepts including data lakes, schema discovery, metadata management, and cloud-based analytics.

---

# Architecture

```text
fixed_sales_data.csv
        ↓
     Amazon S3
        ↓
 AWS Glue Crawler
        ↓
AWS Glue Data Catalog
        ↓
   Amazon Athena
```

---

# AWS Services Used

| Service               | Purpose                     |
| --------------------- | --------------------------- |
| Amazon S3             | Store raw sales CSV data    |
| AWS Glue Crawler      | Automatically detect schema |
| AWS Glue Data Catalog | Store metadata and tables   |
| Amazon Athena         | Query data using SQL        |
| IAM                   | Manage AWS permissions      |

---

# Dataset Information

Dataset Used:

```text
fixed_sales_data.csv
```

Columns:

* order_id
* customer_name
* product
* category
* quantity
* price
* order_date
* city

---

# Project Workflow

## 1. Data Ingestion

The CSV dataset was uploaded into an Amazon S3 bucket inside a raw data layer.

Example S3 Path:

```text
s3://stavan-sales-project/sales-project/raw/
```

---

## 2. Schema Discovery

AWS Glue Crawler scanned the CSV file and automatically detected the dataset schema.

The crawler generated metadata tables inside the AWS Glue Data Catalog database.

Database:

```text
sales_db3
```

Table:

```text
raw
```

---

## 3. Data Querying

Amazon Athena was used to perform SQL-based analytics directly on top of the S3 data without managing servers or databases.

---

# Sample Athena Queries

## View Dataset

```sql
SELECT *
FROM sales_db3.raw
LIMIT 10;
```

---

## Total Revenue

```sql
SELECT SUM(price * quantity) AS total_revenue
FROM sales_db3.raw;
```

---

## Revenue by City

```sql
SELECT city,
       SUM(price * quantity) AS revenue
FROM sales_db3.raw
GROUP BY city
ORDER BY revenue DESC;
```

---

## Top Selling Products

```sql
SELECT product,
       SUM(quantity) AS total_quantity
FROM sales_db3.raw
GROUP BY product
ORDER BY total_quantity DESC;
```

---

## Category-wise Revenue

```sql
SELECT category,
       SUM(price * quantity) AS revenue
FROM sales_db3.raw
GROUP BY category;
```

---

# Curated Data Layer

A curated analytics table was created using Athena transformations.

```sql
CREATE TABLE sales_db3.curated_sales AS
SELECT order_id,
       customer_name,
       product,
       category,
       quantity,
       price,
       quantity * price AS total_amount,
       city,
       order_date
FROM sales_db3.raw;
```

---

# Key Concepts Learned

* Data Lakes
* AWS Glue Crawlers
* Schema Discovery
* Metadata Catalog
* Serverless Querying
* SQL Analytics on Cloud
* ETL Basics
* Raw vs Curated Data Layers
* IAM Role Management

---

# Folder Structure

```text
aws-sales-analytics-pipeline/
│
├── data/
│   └── fixed_sales_data.csv
│
├── queries/
│   └── sales_queries.sql
│
├── screenshots/
│
├── architecture/
│
└── README.md
```

---

# Future Improvements

* Add Amazon QuickSight Dashboard
* Implement Glue ETL Jobs
* Add PySpark Transformations
* Create Partitioned Data Architecture
* Integrate Apache Airflow
* Build Real-Time Streaming Pipeline
* Integrate Amazon Redshift

---

# Screenshots

Add screenshots of:

* S3 Bucket
* Glue Crawler
* Glue Tables
* Athena Queries
* Query Results

inside the `screenshots/` folder.

---

# Author

Stavan Pandya

Aspiring Data Engineer focused on AWS, Data Pipelines, ETL Workflows, and Cloud Analytics.
