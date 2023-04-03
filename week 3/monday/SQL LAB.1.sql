USE sakila;

#Review the tables in the database.
SHOW tables 

#Explore tables by selecting all columns from each table or using the in built review features for your client.

#Select one column from a table. Get film titles.
SELECT title from sakila.film;

#Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT name from sakila.language;

#Find out how many stores does the company have?
SELECT store_id, count(*) from sakila.store;

#Find out how many employees staff does the company have?
SELECT count(staff_id) from sakila.staff;

#Return a list of employee first names only?
SELECT first_name FROM sakila.staff;
