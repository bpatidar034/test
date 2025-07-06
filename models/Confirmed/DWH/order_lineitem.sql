{{config(materialized='table')}}

select 
o.order_key,
count(1) as order_unique_items,
{{calculate_sum('line_quantity')}} as order_total_quantity
from {{ref('stg_order')}} as o
inner join {{ref('stg_lineitem')}} as i
on i.orderkey=o.order_key
group by o.order_key