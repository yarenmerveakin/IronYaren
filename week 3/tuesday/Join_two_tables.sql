USE sakila;

#Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(fa.film_id)                                                                    
FROM actor as a inner join film_actor as fa
ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id
ORDER BY count(fa.film_id) desc
limit 1;


# 2. Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(rental_id)
FROM customer as c inner join rental as r
using (customer_id)
GROUP BY customer_id
ORDER BY count(rental_id) desc
limit 1;

# 3. List number of films per category.
SELECT name, count(film_id) 
from category  as c left join film_category as fc
on fc.category_id = c.category_id
group by c.category_id, c.name;


# 4. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address 
FROM staff as s inner join address as a 
on s.address_id = a.address_id;


# 5. Get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT DISTINCT f.title, l.name 
FROM language as l INNER JOIN film as f 
USING (language_id)
WHERE f.title LIKE 'M%' AND
l.name BETWEEN  "English" AND "Italian"
ORDER BY f.title DESC;


# 6. Display the total amount rung up by each staff member in August of 2005.
SELECT  first_name, last_name, sum(amount)
FROM staff as s inner join payment as p
ON s.staff_id = p.staff_id 
WHERE payment_date LIKE '2005-08%'
group by staff_id
ORDER BY staff_id desc;


# 7. List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id)
FROM film as f inner join film_actor as fa
ON f.film_id = fa.film_id
GROUP BY f.title;


# 8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name
SELECT last_name, sum(amount)
FROM sakila.customer as c inner join sakila.payment as p
ON c.customer_id = p.customer_id
GROUP BY 1 
ORDER BY 1;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT first_name
FROM actor as a inner join film_actor as fa
ON a.actor_id = fa.actor_id
WHERE film_id is null;

# 10. Get the addresses that have NO customers, and ends with the letter "e".
SELECT address
FROM sakila.address as a left join customer as c
ON a.address_id = c.address_id 
WHERE a.address like 'e%' AND customer_id is null;

# Optional: what is the most rented film?
SELECT f.title 
FROM film as f inner join inventory as i
ON f.film_id = i.film_id
inner join rental as r 
ON i.inventory_id = r.inventory_id
GROUP BY 1
ORDER BY count(r.rental_id) desc
Limit 1;
