{{config(materialized='table')}}
with tb1 as (
select customer_id,
customer_name,
customer_segment,
email,
ssn
from {{source('datafeed_shared_schema','ROW_CUSTOMERS')}}
)
select * from tb1