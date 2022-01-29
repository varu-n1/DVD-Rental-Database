/* Question 1:
We want to understand more about the movies that families are watching. 
The following categories are considered family movies: Animation, Children, Classics, Comedy, Family and Music.
Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out. 
*/

SELECT title film_title, name category_name, COUNT(rental_id) rental_count
FROM (SELECT film_id,
	title
	FROM film
	ORDER BY 1) sub
JOIN (SELECT film_id, film_category.category_id, name 
	FROM film_category
	join category ON film_category.category_id = category.category_id) sub1
	ON sub.film_id = sub1.film_id
JOIN (SELECT film_id, rental_id, inventory.inventory_id
	FROM inventory
	join rental ON inventory.inventory_id = rental.inventory_id) sub3
	ON sub.film_id = sub3.film_id

WHERE sub1.name = 'Animation' OR sub1.name = 'Children' OR sub1.name = 'Classics' OR sub1.name = 'Comedy' 
	OR sub1.name = 'Family' OR sub1.name = 'Music'
GROUP BY 1, 2
ORDER BY 2, 1