{{config(materialized='table')}}
with tb1 as (
select c_custkey as custkey,
c_name as name,
c_address as address,
c_nationkey as nationkey,
c_phone as phone,
c_acctbal as acctbal,
c_mktsegment as mktsegment,
c_comment as comments
from {{source("Snowflake_data",'raw_customer_nation')}})
select * from tb1



