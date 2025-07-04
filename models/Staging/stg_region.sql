{{config(materialized='table')}}
with tb1 as (
select r_regionkey as regionkey,
r_name as name,
r_comment as comment
from {{source("Snowflake_data",'RAW_REGION')}}
)
select * from tb1