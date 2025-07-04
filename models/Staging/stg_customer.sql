{{config(materialized='table')}}
with tb1 as (
    select c_custkey as customer_key,
    c_name as customer_name,
    c_nationkey as nation_key
    from {{source("Snowflake_data",'RAW_CUSTOMER')}})
    select * from tb1