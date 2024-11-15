--US Candy Distributor project

-- 1. Company's performance

SELECT
  EXTRACT (YEAR FROM order_date) AS year,
  SUM(ROUND(sales)) AS total_sales,
  SUM(ROUND(gross_profit)) AS total_profit,
  COUNT(order_id) AS total_orders
FROM `practice-project-2024-434414.sql_project.candy_sales`
GROUP BY year
ORDER BY year

-- 2. Sales by Division

SELECT
  EXTRACT (YEAR FROM order_date) AS year,
  division,
  SUM(ROUND(sales)) AS total_sales,
FROM `practice-project-2024-434414.sql_project.candy_sales`
WHERE order_date >= '2024-01-01'
GROUP BY year, division
ORDER BY year, division

-- 3. Monthly sales

SELECT
EXTRACT (YEAR FROM order_date) AS year,
EXTRACT (MONTH FROM order_date) AS month,
SUM(sales) AS total_sales
FROM `practice-project-2024-434414.sql_project.candy_sales`
WHERE order_date >= '2023-01-01'
GROUP BY year, month
ORDER BY year, month

-- 4. Sales by State

SELECT
  state,
  EXTRACT (YEAR FROM order_date) AS year,
  SUM(sales) AS total_sales
FROM `practice-project-2024-434414.sql_project.candy_sales`
WHERE order_date >= '2024-01-01'
GROUP BY year, state
ORDER BY year, state

--5. Sales by Product

SELECT
  product_name,
  SUM(sales) AS total_sales
FROM `practice-project-2024-434414.sql_project.candy_sales`
WHERE order_date >= '2024-01-01'
GROUP BY product_name
ORDER BY total_sales DESC

--6. Sales by Factory

SELECT
  factory.factory,
  SUM(sales.sales) AS total_sales,
  SUM(sales.sales)*100/SUM(SUM(sales.sales)) over() AS percent
FROM `practice-project-2024-434414.sql_project.candy_sales` AS sales
INNER JOIN `practice-project-2024-434414.sql_project.candy_product` AS factory
ON sales.product_name = factory.product_name
WHERE order_date >= '2024-01-01'
GROUP BY factory

--7. Which product lines have the best product margin?

SELECT
  product_name,
  ROUND(SUM(gross_profit)/SUM(sales) * 100) AS margin
FROM `practice-project-2024-434414.sql_project.candy_sales`
WHERE order_date >= '2024-01-01'
GROUP BY product_name
ORDER BY margin DESC

--8. Factory - Customer connection - to count average shipping distances

CREATE TABLE `practice-project-2024-434414.sql_project.candy_sales_1` AS
SELECT 
  order_id, 
  order_date, 
  country,
  city,
  state,
  CAST(postal_code AS INT64) AS zip_code,
  product_name,
  sales
FROM `practice-project-2024-434414.sql_project.candy_sales`
WHERE order_date >= '2024-01-01'



SELECT 
  sales.order_date AS order_date,                                                                                                                                                                             
  sales.state AS state,
  sales.zip_code AS zip_code,
  sales.product_name AS product,
  sales.sales AS sales,
  factories.factory AS factory,
  factory_zip.Latitude AS latitude,
  factory_zip.Longitude AS longitude,
  customer_zip.lat AS lat,
  customer_zip.lng AS lng,
FROM `practice-project-2024-434414.sql_project.candy_sales_1` AS sales
INNER JOIN `practice-project-2024-434414.sql_project.candy_product` AS factories
ON sales.product_name = factories.product_name
INNER JOIN `practice-project-2024-434414.sql_project.factory_zip` AS factory_zip
ON factories.factory = factory_zip.Factory
LEFT JOIN `practice-project-2024-434414.sql_project.customer_zip` AS customer_zip
ON sales.zip_code = customer_zip.zip
                                                                                                                                                                                     