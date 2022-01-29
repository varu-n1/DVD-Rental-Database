/* 
Question 2: Now we need to know how the length of rental duration of these family-friendly movies
compares to the duration that all movies are rented for. 
Can you provide a table with the movie titles and divide them into 4 levels
(first_quarter, second_quarter, third_quarter, and final_quarter) based on
the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories?
Make sure to also indicate the category that these family-friendly movies fall into.
*/
SELECT sub.t film_title, sub1.n category_name, sub.rd rental_duration, NTILE(4) OVER(ORDER BY rd ) standard_quartile
FROM (SELECT film_id f, title t, rental_duration rd
		FROM film) sub
JOIN (SELECT fc.film_id f, c.name n
		FROM film_category fc
		JOIN category c 
		ON fc.category_id = c.category_id
	 	WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')) sub1
	ON sub.f = sub1.f
