USE `classicmodels`;

/*Question 1 : The order numbers and order dates of the three oldest orders*/
SELECT orderNumber, orderDate FROM orders ORDER BY orderDate LIMIT 3;

/*Question 2: The name of the product with the 2nd highest quantity in stock*/
select productName, quantityInStock from products order by quantityInStock desc limit 1 offset 1;

/*Question 3: The order numbers and required dates of any orders that have a status of ‘In Process’. 
 * 	Results must be sorted in descending order by the date when the order was made.*/
select orderNumber, requiredDate from orders where status like 'In Process' order by orderDate desc;


/*Question 4: A list of the distinct order statuses alongside the number of orders with each status. 
 * 	Results must be sorted in descending order by the number of orders*/
select status, count(*) from orders group by status order by count(*) desc;

/*Question 5: A list of product lines alongside a second column with the heading ‘products’. 
 * 		Each row in this second column an alphabetically ordered, 
 * 			semi-colon-separated list of product names in the product line indicated by 
 * 			value in the first column.*/
select productLine, group_concat(productName order by productName separator';') as products 
	from products group by productLine;

/*Question 6: A list of years. For each year, show the total and average amount of payments in that year. 
 * 		Round the total and average to 2 decimal places, and use appropriate headings in the result set. 
 * 		HINT: You can use functions like YEAR() in the GROUP BY clause*/
select year(paymentDate) as year, round(sum(amount), 2) as 'Total Amount of Payments', round(avg(amount),2) as 'Average Amount of Payments'
	from payments group by  year(paymentDate) order by paymentDate asc; 


/*Question 7: A list of product lines that have more than one product for which the quantity in stock is less than 500. 
 * 		HINT: Start by writing a query that gives you a list of products with a quantity in stock of less than 500. 
 * 		Now edit that query to yield a count of how many such products are in each product line. 
 * 		Finally, edit the query again to yield only those product lines that have a count greater than.

 * 		HINT: the only such product line is ‘Motorcylces’*/
select productLine from products where quantityInStock < 500 group by productLine having count(*) > 1;

/*Question 8: A list of customer numbers for customers who 5 or more shipped orders (meaning status is ‘Shipped’) in 2004. 
 * 	Beside each customer number, a second column must show the number of such orders made by each customer. 
 * 	The results must be sorted in descending order by number of shipped orders. 
	 * HINT: Start by writing a query that yields the order information for shipped orders made in 2004. 
	 * Now edit that query to yield a list of customer numbers alongside the number of such orders made by each customer number. 
	 * Then edit the query again to yield only those customer numbers that made 5 or more orders. 
	 * Finally, sort the results as per the description above.*/
select customerNumber , count(*) as shippedOrders from orders where status='Shipped' and year(orderDate) = 2004
	group by customerNumber having shippedOrders > 4 order by shippedOrders desc;