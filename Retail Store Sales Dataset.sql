-- Retail Store Sales Dataset

-- 1. List all transactions that occurred in March 2021
SELECT * FROM retail_sales WHERE YEAR(transactiondate) = 2021 AND MONTH(transactiondate) = 3;

-- 2. Find the top 10 most expensive products sold
SELECT productname, price FROM retail_sales ORDER BY price DESC LIMIT 10;

-- 3. What is the total sales amount for each product category?
SELECT category, SUM(totalsale) AS total_sales FROM retail_sales GROUP BY category;

-- 4. Find the number of transactions made by the customer "Michael Smith"
SELECT COUNT(*) AS michael_smith_transactions FROM retail_sales WHERE customername = 'Michael Smith';

-- 5. What is the transaction with the highest total sale amount?
SELECT transactionid, totalsale FROM retail_sales ORDER BY totalsale DESC LIMIT 1;

-- 6. List all transactions where the total sale amount is greater than $500 and the discount applied is greater than 10%
SELECT transactionid FROM retail_sales WHERE totalsale > 500 AND discount > 0.1;

-- 7. What is the total number of transactions in the "Electronics" category?
SELECT COUNT(*) AS electronics_transactions FROM retail_sales WHERE category = 'Electronics';

-- 8. Find the transaction with the lowest price for any product sold
SELECT transactionid, price FROM retail_sales ORDER BY price ASC LIMIT 1;

-- 9. What is the average total sale amount for transactions involving customers aged over 40?
SELECT AVG(totalsale) AS avg_totalsale FROM retail_sales WHERE customerage > 40;

-- 10. List all transactions in the "Grocery" category that have a total sale amount of $100 or more
SELECT transactionid FROM retail_sales WHERE category = 'Grocery' AND totalsale >= 100;

-- 11. Find the top 5 store locations with the highest total sales
SELECT storelocation, SUM(totalsale) AS total_sales 
FROM retail_sales 
GROUP BY storelocation 
ORDER BY total_sales DESC 
LIMIT 5;

-- 12. What is the average price of products purchased by customers under the age of 30?
SELECT AVG(price) AS avg_price FROM retail_sales WHERE customerage < 30;

-- 13. Which transactions were paid for using "Credit Card"?
SELECT transactionid FROM retail_sales WHERE paymentmethod = 'Credit Card';

-- 14. What percentage of transactions had a total sale amount higher than $200?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM retail_sales)) AS percentage_high_sales
FROM retail_sales 
WHERE totalsale > 200;

-- 15. Find the total sales from all transactions made in "New York" in 2020
SELECT SUM(totalsale) AS total_sales FROM retail_sales WHERE storelocation = 'New York' AND YEAR(transactiondate) = 2020;

-- 16. What is the highest total sale amount for any transaction in the "Clothing" category?
SELECT transactionid, totalsale FROM retail_sales WHERE category = 'Clothing' ORDER BY totalsale DESC LIMIT 1;

-- 17. List all transactions that have both a quantity greater than 3 and a discount greater than 5%
SELECT transactionid FROM retail_sales WHERE quantity > 3 AND discount > 0.05;

-- 18. What is the correlation between price and total sale amount?
SELECT CORR(price, totalsale) AS correlation_price_totalsale FROM retail_sales;

-- 19. Find the average total sale amount and quantity sold for each product category
SELECT category, AVG(totalsale) AS avg_totalsale, AVG(quantity) AS avg_quantity 
FROM retail_sales 
GROUP BY category;

-- 20. Which 5 transactions had the highest quantity sold but the lowest total sale amount?
SELECT transactionid, quantity, totalsale 
FROM retail_sales 
ORDER BY quantity DESC, totalsale ASC 
LIMIT 5;
