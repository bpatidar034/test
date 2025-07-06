{{config(materialized='table')}}
with tb1 as (
select o_orderkey as order_key,
o_totalprice as order_total,
cast(o_orderdate as date) as order_date,
date_trunc('month',cast(o_orderdate as date)) as order_month,
case
when o_orderstatus='O' then 'Open'
when o_orderstatus='F' then 'Filled'
when o_orderstatus='P' then 'Processing'
end as order_status
from {{source("Snowflake_data",'RAW_ORDER')}}
)
select * from tb1