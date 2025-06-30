{{config(materialized='incremental',
unique_key='ORDER_ID',
incremental_strategy='merge' )}}
select * from {{source("datafeed_shared_schema",'raw_orders')}} where order_id in (1,2,3,4,5)