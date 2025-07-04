{% snapshot snap_order_delete_check %}
{{config(target_schema='snapshots',
         strategy='check',
         unique_key='order_id',
         check_cols=['customer_id','product_id','order_date','sales','quantity'],
         invalidate_hard_deletes=true)}}
select * from {{source("datafeed_shared_schema",'raw_orders')}}
{% endsnapshot %}




