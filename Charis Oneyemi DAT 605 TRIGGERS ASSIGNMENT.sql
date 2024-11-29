-- Charis Oneyemi
-- MSc Data Science


-- Here, we are creating a database called "movie_rental"
create database movie_rental


-- Here I'm creating a customers table with columns for customer ID, name, join date, and status. 
-- The customer_id will auto-increment because I used serial type unlike the regular int
create table customers (
    customer_id serial primary key,
    name varchar(300) not null,
    join_date timestamp,
    status varchar(50)
)


-- A rentals table is created to track rentals. It has a foreign key relationship to the customers table.
create table rentals (
    rental_id serial primary key,
    customer_id int,
    movie_title varchar(300),
    rental_date timestamp,
    return_date timestamp,
    foreign key (customer_id) references customers(customer_id)
)
 

-- I just inserted sample data
-- I also used now()to get the current timestamp at the moment
insert into customers (name, join_date, status) values
('Darasimi', now(), 'inactive'),
('Jackie', now(), 'inactive'),
('Mike', now(), 'inactive')

select * from customers
-- This command shows us all the records from the customers table


-- Here, I created a function named after_customer_activation
-- What it doess is that it inserts a new rental record for a customer when their status changes to "active"
create or replace function after_customer_activation()
returns trigger as $$
begin
    -- checking if the customer status is changed to 'active'
    if new.status = 'active' then
        -- inserting a new record for the customer
        insert into rentals (customer_id, movie_title, rental_date)
        values (new.customer_id, 'Inception', now());
    end if;
    return new;
end;
$$ language plpgsql;



-- A trigger is created, which will call the after_customer_activation function after any update on the customers table
create trigger after_customer_activation
after update on customers
for each row
execute function after_customer_activation();


-- Here I'm updating customer status to active. That is our customer with ID 1 ie Darasimi
-- This update will also activate the trigger, inserting a new rental record
update customers
set status = 'active'
where customer_id = 1;


-- After updating, a new record will be inserted into the rentals table and this select statement just show us the records in rentals
select * from rentals;