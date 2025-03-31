
-- 1. top 3 customer based on order
select c.first_name, c.last_name,  sum(o.total_amount) as total_order_amount 
from customer as c join orders as o on o.customer_id = c.customer_id 
group by c.customer_id 
order by total_order_amount desc 
limit 3;

-- 2. average order value for each customer
select 
	c.first_name,
    c.last_name,
    avg(o.total_amount) average_order
from customer c 
join orders o on c.customer_id = o.customer_id
group by c.customer_id;

-- 3. employees with >4 resolve ticket support
select 
	e.first_name,
    e.last_name,
    count(s.ticket_id) 
from employees e
join SupportTickets s on e.employee_id = s.employee_id
where s.status = 'resolved'
group by e.employee_id
having count(s.ticket_id) >4;

-- 4. product yg belum pernah dipesan
select 
	p.product_name
from product p
left join OrderDetails on OrderDetails.product_id = p.product_id
where OrderDetails.order_id is null;

-- 5. total pendapatan dari revenue
select
	sum(quantity * unit_price)
from orderDetails;

-- 6. harga rata-rata tiap kategori produk
with cte_avg_price as(
	select 
		category,
		avg(price) rerata
	from product
	group by category
) select * from cte_avg_price where rerata>500;

-- 7. pelanggan yg pernah order melebihi 1000
select * from customer 
where customer_id in
(select customer_id
from orders
where total_amount>1000);
