-- 1. List all customers who live in Texas (Use JOINS)
select *
from customer;

select first_name, last_name,district
from customer
full join address
on customer.address_id = address.address_id 
where district = 'Texas';
-- 2. Get all payments above 6.99 with the customer's full_name

select first_name, last_name, amount
from payment
full join customer
on payment.customer_id = customer.customer_id
where amount > 6.99;


-- 3. Show all customers who made payments over $175 ( Use subqueries)

SELECT COUNT(amount), first_name
FROM payment 
JOIN customer ON customer.customer_id = payment.customer_id
WHERE amount > 175
GROUP BY first_name;


-- 4. List all customers that live in Nepal ( use the city table)

select *
from customer;

select first_name, last_name, customer_id
from customer
FULL join address on address.address_id = customer.address_id 
full join city on city.city_id = address.city_id 
full join country on country.country_id = city.country_id 
where country.country = 'Nepal';


-- 5. Which staff member had the most transactions?

select first_name, last_name, count(staff.staff_id)
from staff
Full join rental on rental.staff_id = staff.staff_id
group by staff.staff_id
order by count(staff.staff_id) desc
limit 1;


-- 6. How many movies of each rating are there?
select rating, count(rating)
from film
group by rating;


-- 7. Show all customers who have made a single payment above $6.99 (Use subqueries)
select *
from customer;

select customer_id
from payment
group by customer_id
having sum(payment.amount) > 6.99; 


-- 8. How many free rentals did our store give away?
select count(amount)
from payment where amount = 0;