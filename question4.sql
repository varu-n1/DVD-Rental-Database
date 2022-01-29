/*
Question 4:
We want to find out how the two stores compare in their count of rental orders during every month for all the years 
we have data for. Write a query that returns the store ID for the store, the year and month and the number of rental
orders each store has fulfilled for that month. Your table should include a column for each of the following: year, month, 
store ID and count of rental orders fulfilled during that month.
*/

SELECT DATE_PART('month',rental_date) AS rental_month, DATE_PART('year',rental_date) AS rental_year, store_id, COUNT(rental_id)
FROM (SELECT rental_id, rental_date, inventory_id
	FROM rental
	 ) sub
JOIN inventory
	ON sub.inventory_id = inventory.inventory_id
GROUP BY 3, 2, 1
ORDER BY 4 DESC