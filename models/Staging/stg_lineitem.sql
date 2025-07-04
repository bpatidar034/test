{{config(materialized='table')}}
with tb1 as (
select concat(l_orderkey,'_',l_linenumber) as line_key,
l_orderkey as orderkey,
l_quantity as line_quantity
from {{source("Snowflake_data",'RAW_LINEITEM')}}
)
select * from tb1
