USE `classicmodels`;

/*Question 1 : Each customer may have made many orders consisting of many products per order. 
 			* What is the TOTAL amount ordered per customer? Show customer numbers, names, and total amounts. 
 			* There should be one row per customer.*/
select
	customerNumber,
	customerName,
	sum(priceEach*quantityOrdered) as `total amounts`
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
group by
	customerNumber;

/*Question 2: What is the average of the total amounts ordered per customer that you calculated in #1?*/
select
	customerNumber,
	customerName,
	avg(priceEach*quantityOrdered) as `average of the total amounts`
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
group by
	customerNumber;

/*Question 3: What is the name and buy price of the most expensive product (as determined by products.buyPrice)?*/
select
	productName,
	productCode,
	buyPrice
from
	products
where
	`buyPrice` =(
	select
		max(`buyPrice`)
	from
		products);


/*Question 4: List the customerNumbers AND names of DISTINCT customers who have purchased the most expensive product. 
 			* Let's call these "expensive-taste" customers.*/
select
	distinct customerNumber,
	customerName as `expensive-taste`
from
	customers
join orders
		using (customerNumber)
where
	orderNumber in (
	select
		orderNumber
	from
		orderdetails
	join products
			using (productCode)
	where
		productCode in (
		select
			productCode
		from
			products
		where
			buyPrice = (
			select
				MAX(buyPrice)
			from
				products)));

/*Question 5: List the customerNumbers AND names of expensive-taste customers. 
 				* Beside each of these customers, also include their TOTAL amount of products ordered. 
 				* (This total should be the total they have ordered for ALL products, not just the most expensive product.)*/
select
	customerNumber,
	customerName as `expensive-taste`,
	SUM(orderdetails.quantityOrdered*orderdetails.priceEach) as `TOTAL amount of products ordered`
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
where
	customerNumber in(
	select
		customerNumber
	from
		orders
	where
		orderNumber in (
		select
			orderNumber
		from
			orderdetails
		join products
				using (productCode)
		where
			productCode in (
			select
				productCode
			from
				products
			where
				buyPrice = (
				select
					MAX(buyPrice)
				from
					products)) ) )
	group by customerNumber ;			


/*Question 6: Which of the expensive-taste customers have ordered 
			* more in total than the average total amount ordered per customer across the whole data set?*/
select
	customerNumber,
	customerName as `expensive-taste`,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as `Total amount more than average amount`
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
where
	customerNumber in(
	select
		customerNumber
	from
		orders
	where
		orderNumber in (
		select
			orderNumber
		from
			orderdetails
		join products
				using (productCode)
		where
			productCode in (
			select
				productCode
			from
				products
			where
				buyPrice = (
				select
					MAX(buyPrice)
				from
					products)) ) )
	group by customerNumber
having
	sum(orderdetails.quantityOrdered*orderdetails.priceEach)> (
	select
		avg(totalAmounts)
	from
		(
		select
			customerNumber,
			customerName,
			sum(priceEach*quantityOrdered) as totalAmounts
		from
			customers
		join orders
				using (customerNumber)
		join orderdetails
				using (orderNumber)
		group by
			customerNumber) as customerAverageTotalAmounts) ;

		
/*Question 7a: Create OR REPLACE a view called "expensiveTasteCustomers" corresponding to your query from #4 above*/
create or replace
view expensiveTasteCustomers as
select
	orderNumber
from
	orderdetails
join products
		using (productCode)
where
	productCode in (
	select
		productCode
	from
		products
	where
		buyPrice = (
		select
			MAX(buyPrice)
		from
			products)) ;

/*Question 7b: Rewrite your answer to #5 using this view*/
select
	customerNumber,
	customerName as `expensive-taste`,
	SUM(orderdetails.quantityOrdered*orderdetails.priceEach) as `TOTAL amount of products ordered`
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
where
	customerNumber in(
	select
		customerNumber
	from
		orders
	where
		orderNumber in (
		select
			*
		from
			expensiveTasteCustomers) )
	group by customerNumber ;


/*Question 8a: Create OR REPLACE a view called "purchaseTotals" corresponding to your query from #1 above*/
create or replace
view purchaseTotals as
select
	customerNumber,
	customerName,
	sum(priceEach*quantityOrdered) as totalAmounts
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
group by
	customerNumber ;


/*Question 8b: Rewrite your answer to #6 using BOTH views you have created*/
select
	customerNumber,
	customerName as `expensive-taste`,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as `Total amount more than average amount`
from
	customers
join orders
		using (customerNumber)
join orderdetails
		using (orderNumber)
where
	customerNumber in(
	select
		customerNumber
	from
		orders
	where
		orderNumber in (
		select
			*
		from
			expensiveTasteCustomers) )
	group by customerNumber
having
	sum(orderdetails.quantityOrdered*orderdetails.priceEach)> (
	select
		avg(totalAmounts)
	from
		(
		select
			*
		from
			purchaseTotals) as customerAverageTotalAmounts) ;