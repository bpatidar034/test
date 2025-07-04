{{config(materialized='table')}}
with tb1 as (
select ps_partkey,
ps_suppkey,
ps_availqty as availqty,
ps_supplycost as supplycost,
ps_comment as comment
from {{source("Snowflake_data",'RAW_PARTSUPP')}}
)
select * from tb1