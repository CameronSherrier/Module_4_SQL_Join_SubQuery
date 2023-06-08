select customer.customer_id, first_name, last_name, district
from customer
full join address
on customer.address_id  = address.address_id
where district = 'Texas';

select customer.customer_id, first_name, last_name, amount
from payment
inner join customer
on customer.customer_id = payment.customer_id
where amount > 6.99;

select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having SUM(amount) > 175
);

select first_name, last_name, city
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
where city like 'N%';

select staff.staff_id, first_name, last_name, COUNT(rental_id)
from rental
inner join staff
on rental.staff_id = staff.staff_id
group by staff.staff_id;

select rating, COUNT(rating)
from film
group by rating;

select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);

select rental_id
from payment
group by rental_id
HAVING SUM(amount) < 0.00
order by rental_id desc;