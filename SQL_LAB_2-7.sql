USE sakila;

#How many films are there for each of the categories in the category table. 
#Use appropriate join to write this query.

#Here I have a look on the 
SELECT * FROM sakila.film_category; 
SELECT * FROM sakila.category;
SELECT COUNT(DISTINCT film_id) FROM sakila.film;

SELECT c.category_id, COUNT(DISTINCT film_id) as 'Number of films'
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY category_id
ORDER BY category_id ASC;


#Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;
SELECT s.last_name, SUM(p.amount) as total_amount
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE payment_date between '2005-08-01' and '2005-09-01'
GROUP BY last_name;


#Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, MAX(f.actor_id)
FROM sakila.film_actor f
JOIN sakila.actor a USING (actor_id);



#Most active customer (the customer that has rented the most number of films)
SELECT MAX(c.first_name), last_name
FROM sakila.rental r
JOIN sakila.customer c USING (customer_id);


#Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a USING (address_id);


#List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id)
FROM sakila.film f
JOIN sakila.film_actor USING (film_id)
GROUP BY title;



#Using the tables payment and customer and the JOIN command, list the total paid by each customer.
# List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount)
FROM sakila.payment p
JOIN sakila.customer c USING (customer_id)
GROUP BY c.customer_id;


#List number of films per category.
SELECT c.name as 'category', COUNT( fc.film_id) 'number of films'
FROM sakila.category c
JOIN sakila.film_category fc USING (category_id)
GROUP BY c.name;
