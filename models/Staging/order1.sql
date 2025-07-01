{{ config(materialized="table", transient=false) }}

with
    tb1 as (
        select
            order_id,
            customer_id,
            address_id,
            product_id,
            order_date,
            ship_date,
            ship_mode,
            sales,
            quantity,
            order_discount,
            profit,
            shipping_cost,
            order_priority,
            channel
        from {{ source("datafeed_shared_schema", "stg_orders") }}
    )
select *
from tb1
