{{config(materialized='table')}}
with tb1 as (
select n_nationkey as nation_key,
n_name as customer_nation
from {{source("Snowflake_data",'RAW_NATION')}}
)
select * from tb1