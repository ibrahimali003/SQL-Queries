-- This dataset is called "Global Superstore Dataset", which contains sales data for an international retail store. The dataset includes information on orders, customers, sales, profit, and shipping details.

-- 1. List all orders placed in 2020
SELECT * FROM superstore_sales WHERE YEAR(order_date) = 2020;

-- 2. Find the top 10 most profitable orders
SELECT order_id, profit FROM superstore_sales ORDER BY profit DESC LIMIT 10;

-- 3. What is the total sales for each country?
SELECT country, SUM(sales) AS total_sales FROM superstore_sales GROUP BY country;

-- 4. Find the number of orders placed by the customer "John Doe"
SELECT COUNT(*) AS john_doe_orders FROM superstore_sales WHERE customer_name = 'John Doe';

-- 5. What is the highest discount ever applied to an order?
SELECT order_id, discount FROM superstore_sales ORDER BY discount DESC LIMIT 1;

-- 6. List all orders where the profit is higher than $1000 and the shipping cost is less than $50
SELECT order_id FROM superstore_sales WHERE profit > 1000 AND shipping_cost < 50;

-- 7. What is the total number of orders placed in the "Technology" category?
SELECT COUNT(*) AS tech_orders FROM superstore_sales WHERE category = 'Technology';

-- 8. Find the order with the highest shipping cost
SELECT order_id, shipping_cost FROM superstore_sales ORDER BY shipping_cost DESC LIMIT 1;

-- 9. What is the average profit for orders with more than 5 units sold?
SELECT AVG(profit) AS avg_profit FROM superstore_sales WHERE quantity > 5;

-- 10. List all orders in the "Furniture" category that have a profit of $500 or more
SELECT order_id FROM superstore_sales WHERE category = 'Furniture' AND profit >= 500;

-- 11. Find the top 5 countries with the highest total sales
SELECT country, SUM(sales) AS total_sales 
FROM superstore_sales 
GROUP BY country 
ORDER BY total_sales DESC 
LIMIT 5;

-- 12. What is the average shipping cost of orders shipped to the United States?
SELECT AVG(shipping_cost) AS avg_shipping_cost FROM superstore_sales WHERE country = 'United States';

-- 13. Which orders had a discount of 20% or more?
SELECT order_id, discount FROM superstore_sales WHERE discount >= 0.2;

-- 14. What percentage of orders had a profit higher than $100?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM superstore_sales)) AS percentage_high_profit
FROM superstore_sales 
WHERE profit > 100;

-- 15. Find the total profit generated from orders shipped with "High" priority
SELECT SUM(profit) AS total_profit FROM superstore_sales WHERE order_priority = 'High';

-- 16. What is the highest-sales order in the "Office Supplies" category?
SELECT order_id, sales FROM superstore_sales WHERE category = 'Office Supplies' ORDER BY sales DESC LIMIT 1;

-- 17. List orders that have both a sales amount greater than $500 and a quantity of fewer than 3 items
SELECT order_id FROM superstore_sales WHERE sales > 500 AND quantity < 3;

-- 18. What is the correlation between sales and profit?
SELECT CORR(sales, profit) AS correlation_sales_profit FROM superstore_sales;

-- 19. Find the average sales and profit by product category
SELECT category, AVG(sales) AS avg_sales, AVG(profit) AS avg_profit 
FROM superstore_sales 
GROUP BY category;

-- 20. Which 5 orders had the highest quantity but the lowest profit?
SELECT order_id, quantity, profit 
FROM superstore_sales 
ORDER BY quantity DESC, profit ASC 
LIMIT 5;

