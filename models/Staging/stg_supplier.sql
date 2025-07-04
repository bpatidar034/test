{{config(materialized='table')}}
with tb1 as (
select S_SUPPKEY ,
S_NAME	AS NAME,
S_ADDRESS AS ADDRESS,
S_NATIONKEY	AS NATIONKEY,
S_PHONE	AS PHONE,
S_ACCTBAL AS ACCTBAL,
S_COMMENT AS COMMENT
from {{source("Snowflake_data",'RAW_SUPPLIER')}}
)
select * from tb1