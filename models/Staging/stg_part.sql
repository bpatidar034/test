{{config(materialized='table')}}
with tb1 as (
select p_partkey as partkey,
p_name as name,
p_mfgr as mfgr,
p_brand as brand,
p_type as type,
p_size as size,
p_container as container,
p_comment as comment
from {{source("Snowflake_data",'RAW_PART')}})
select * from tb1


