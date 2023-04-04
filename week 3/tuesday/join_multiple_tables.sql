USE sakila;

# 1. Write a query to display for each store its store ID, city, and country.
SELECT store_id, city.city , country.country
FROM  store LEFT JOIN address ON (store.address_id=address.address_id)
LEFT JOIN city ON (address.city_id=city.city_id)
LEFT JOIN country ON (city.country_id=country.country_id);

# 2. Write a query to display how much business, in dollars, each store brought in.
SELECT sum(payment_amount), s.store_id
FROM payment as p left join staff as s
ON p.staff_id = s.staff_id
GROUP BY s.store_id;

# 3. What is the average running time(length) of films by category?
SELECT f.lenght
FROM film as f inner join film_category as fc
ON f.film_id = fc.film_id
GROUP BY f.length;

# 4. Which film categories are longest(length) (find Top 5)? Hint: You can rely on question 3 output.
SELECT f.lenght
FROM film as f inner join film_category as fc
ON f.film_id = fc.film_id
GROUP BY f.length 
ORDER BY f.lenght
limit 5;

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.

# 6. List the top five genres in gross revenue in descending order.

# 7. Is "Academy Dinosaur" available for rent from Store 1?



