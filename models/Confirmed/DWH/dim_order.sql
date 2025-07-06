{{config(materialized='table')}}
select o.order_key,
o.order_total,
o.order_date,
o.order_month,
o.order_status,
i.order_total_quantity,
c.customer_key,
c.customer_name,
n.customer_nation,
i.order_unique_items
from {{ref('stg_order')}} as o
inner join {{ref('order_lineitem')}} as i 
on o.order_key=i.order_key
inner join {{ref('stg_customer')}} as c
on c.customer_key=o.order_key
inner join {{ref('stg_nation')}} as n
on n.nation_key=c.nation_key