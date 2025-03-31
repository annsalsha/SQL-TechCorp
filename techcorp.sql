create database techcorp;
show databases;
use techcorp;

show tables from techcorp;
create table Product (
	product_id INT auto_increment primary key,
    product_name varchar(100) Not null,
    category varchar(50),
    price decimal(10,2),
    stock_quantity int
);
select * from product;

create table customer(
	customer_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(50) unique,
    phone varchar(30),
    address varchar(200)
);
select * from customer;

create table orders(
	order_id int auto_increment primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    FOREIGN KEY (customer_id) references customer(customer_id)
);

create table orderdetails(
	order_detail_id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal(10,2),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references Product(product_id)
    );
select * from orderdetails;

create table employees(
	employee_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    phone varchar(20),
    hire_date date,
    department varchar(50)
);

create table supportTickets(
	ticket_id int auto_increment primary key,
    customer_id int, 
    employee_id int,
    issue text,
    status varchar(20),
    created_at datetime,
    resolved_at datetime,
    FOREIGN KEY (customer_id) references customer(customer_id),
    FOREIGN KEY (employee_id) references employees(employee_id)
);

alter table Product add column discount decimal(5,2) default 0;
