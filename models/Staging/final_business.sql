{{config(materialized='table')}}
with customer as (

select customer_id,
customer_name
from ROW_CUSTOMERS
), 
order_tbl as (

select 
customer_id,
min(order_date) as first_order_date,
max(order_date) as most_recent_order_date,
count(order_id) as number_of_orders
from {{ref('orders')}}
group by customer_id
), final as (

select c.customer_id,
c.customer_name,
o.first_order_date,
o.most_recent_order_date,
coalesce(o.number_of_orders,0) as number_of_orders
from customer c left join order_tbl o on c.customer_id=o.customer_id
)
select * from final