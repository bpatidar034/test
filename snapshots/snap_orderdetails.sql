{% snapshot snap_orderdetails %}
{{config(
   strategy='check', 
   unique_key='order_key',
   check_cols['order_status','order_total','order_date','order_month',
   'order_total_quantity','customer_key','customer_name','customer_nation'],
)}}

select * from {{ref('dim_order')}}
{% endsnapshot %}
