USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.category_id , COUNT(*) AS number_of_films FROM category AS c
JOIN film_category AS f
ON c.category_id = f.category_id
GROUP BY c.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, sum(amount) AS total FROM payment
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(*) AS number_of_films 
FROM actor AS a
JOIN film_actor AS f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY number_of_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, COUNT(*) AS number_of_rentals 
FROM customer AS c
JOIN rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY number_of_rentals DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address FROM staff AS s
JOIN address AS a
ON s.address_id = a.address_id;

-- 6. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(amount) AS total_paid
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- 7. List number of films per category.
SELECT category_id, COUNT(film_id) AS number_of_films 
FROM film_category
GROUP BY category_id;