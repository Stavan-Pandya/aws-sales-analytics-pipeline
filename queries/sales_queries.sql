1. View Complete Data
SELECT *
FROM sales_db3.raw;
2. Total Revenue
SELECT SUM(price * quantity) AS total_revenue
FROM sales_db3.raw;
3. Total Orders
SELECT COUNT(*) AS total_orders
FROM sales_db3.raw;
4. Distinct Cities
SELECT DISTINCT city
FROM sales_db3.raw;
5. Distinct Categories
SELECT DISTINCT category
FROM sales_db3.raw;
6. Revenue by City
SELECT city,
       SUM(price * quantity) AS revenue
FROM sales_db3.raw
GROUP BY city
ORDER BY revenue DESC;
7. Revenue by Category
SELECT category,
       SUM(price * quantity) AS revenue
FROM sales_db3.raw
GROUP BY category
ORDER BY revenue DESC;
8. Top Selling Products
SELECT product,
       SUM(quantity) AS total_quantity
FROM sales_db3.raw
GROUP BY product
ORDER BY total_quantity DESC;
9. Average Product Price
SELECT AVG(price) AS average_price
FROM sales_db3.raw;
10. Most Expensive Product
SELECT product,
       MAX(price) AS highest_price
FROM sales_db3.raw
GROUP BY product
ORDER BY highest_price DESC;
11. Cheapest Product
SELECT product,
       MIN(price) AS lowest_price
FROM sales_db3.raw
GROUP BY product
ORDER BY lowest_price ASC;
12. Daily Revenue
SELECT order_date,
       SUM(price * quantity) AS daily_sales
FROM sales_db3.raw
GROUP BY order_date
ORDER BY order_date;
13. Orders Greater Than ₹10,000
SELECT *
FROM sales_db3.raw
WHERE price * quantity > 10000;
14. Products Sold in Bangalore
SELECT *
FROM sales_db3.raw
WHERE city = 'Bangalore';
15. Electronics Revenue
SELECT SUM(price * quantity) AS electronics_sales
FROM sales_db3.raw
WHERE category = 'Electronics';
16. Total Quantity Sold
SELECT SUM(quantity) AS total_items_sold
FROM sales_db3.raw;
17. Revenue Per Product
SELECT product,
       SUM(price * quantity) AS product_revenue
FROM sales_db3.raw
GROUP BY product
ORDER BY product_revenue DESC;
18. Create Curated Table
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
19. Query Curated Table
SELECT *
FROM sales_db3.curated_sales;