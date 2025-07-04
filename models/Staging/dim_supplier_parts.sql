{{config(materialized='table')}}
with supplier_parts as (
select * from {{ref('stg_supplier')}} as s
JOIN {{ref('stg_partsupp')}} as ps
ON s.s_suppkey=ps.ps_suppkey
JOIN snowflake_sample_data.tpch_sf1.part sf
ON ps.ps_partkey=sf.p_partkey
)
select s_suppkey as suppkey,
name as supplier_name,
NATIONKEY as nationkey,
ACCTBAL as account_balance,
availqty as available_quantity,
supplycost as supply_cost,
p_partkey as part_key,
p_name as part_name,
p_mfgr as part_manufacturer,
p_brand as part_brand,
p_type as part_type,
p_size as part_size,
p_container as part_container,
p_retailprice as part_retail_price
from supplier_parts