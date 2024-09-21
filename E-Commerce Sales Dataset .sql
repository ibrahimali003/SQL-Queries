-- E-Commerce Sales Dataset

-- 1. List all orders placed in January 2021
SELECT * FROM ecommerce_sales WHERE YEAR(orderdate) = 2021 AND MONTH(orderdate) = 1;

-- 2. Find the top 10 most expensive products sold
SELECT productid, productprice FROM ecommerce_sales ORDER BY productprice DESC LIMIT 10;

-- 3. What is the total sales amount for each product category?
SELECT productcategory, SUM(totalamount) AS total_sales FROM ecommerce_sales GROUP BY productcategory;

-- 4. Find the number of orders placed by the customer "Alice Johnson"
SELECT COUNT(*) AS alice_johnson_orders FROM ecommerce_sales WHERE customername = 'Alice Johnson';

-- 5. What is the order with the highest profit?
SELECT orderid, profit FROM ecommerce_sales ORDER BY profit DESC LIMIT 1;

-- 6. List all orders where the total amount is higher than $500 and the shipping cost is less than $20
SELECT orderid FROM ecommerce_sales WHERE totalamount > 500 AND shippingcost < 20;

-- 7. What is the total number of orders in the "Electronics" category?
SELECT COUNT(*) AS electronics_orders FROM ecommerce_sales WHERE productcategory = 'Electronics';

-- 8. Find the order with the lowest shipping cost
SELECT orderid, shippingcost FROM ecommerce_sales ORDER BY shippingcost ASC LIMIT 1;

-- 9. What is the average total amount for orders with more than 5 units sold?
SELECT AVG(totalamount) AS avg_total_amount FROM ecommerce_sales WHERE quantity > 5;

-- 10. List all orders in the "Clothing" category that have a profit of $100 or more
SELECT orderid FROM ecommerce_sales WHERE productcategory = 'Clothing' AND profit >= 100;

-- 11. Find the top 5 countries with the highest total sales
SELECT country, SUM(totalamount) AS total_sales 
FROM ecommerce_sales 
GROUP BY country 
ORDER BY total_sales DESC 
LIMIT 5;

-- 12. What is the average product price for orders placed by customers under the age of 30?
SELECT AVG(productprice) AS avg_product_price FROM ecommerce_sales WHERE customerage < 30;

-- 13. Which orders had a discount of 20% or more?
SELECT orderid, discount FROM ecommerce_sales WHERE discount >= 0.2;

-- 14. What percentage of orders had a total amount higher than $100?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ecommerce_sales)) AS percentage_high_total
FROM ecommerce_sales 
WHERE totalamount > 100;

-- 15. Find the total profit from all orders paid via "PayPal"
SELECT SUM(profit) AS total_profit FROM ecommerce_sales WHERE paymentmethod = 'PayPal';

-- 16. What is the highest total amount for any order placed in "North America"?
SELECT orderid, totalamount FROM ecommerce_sales WHERE region = 'North America' ORDER BY totalamount DESC LIMIT 1;

-- 17. List orders that have both a product price of more than $200 and a discount of 10% or higher
SELECT orderid FROM ecommerce_sales WHERE productprice > 200 AND discount >= 0.1;

-- 18. What is the correlation between total amount and profit?
SELECT CORR(totalamount, profit) AS correlation_total_profit FROM ecommerce_sales;

-- 19. Find the average total amount and profit for each product category
SELECT productcategory, AVG(totalamount) AS avg_total_amount, AVG(profit) AS avg_profit 
FROM ecommerce_sales 
GROUP BY productcategory;

-- 20. Which 5 orders had the highest quantity but the lowest total amount?
SELECT orderid, quantity, totalamount 
FROM ecommerce_sales 
ORDER BY quantity DESC, totalamount ASC 
LIMIT 5;
