/*
Question 3:
Finally, provide a table with the family-friendly film category, each of the quartiles,
and the corresponding count of movies within each combination of film category for each corresponding rental duration category.
*/

SELECT category_name, standard_quartile, COUNT(film_title)
FROM (SELECT sub.t film_title, sub1.n category_name, sub.rd rental_duration, NTILE(4) OVER(ORDER BY rd ) standard_quartile
	FROM (SELECT film_id f, title t, rental_duration rd
		FROM film) sub
	JOIN (SELECT fc.film_id f, c.name n
		FROM film_category fc
		JOIN category c 
		ON fc.category_id = c.category_id
	 	WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')) sub1
		ON sub.f = sub1.f) main
GROUP BY 1, 2
ORDER BY 1, 2