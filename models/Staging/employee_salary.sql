{{config(materialized='table', transient='false')}}
with tb1 as (
select emp_id,
name,
salary,
tax,
({{calculate_amount('salary','tax')}}) as total_amount
from {{source('datafeed_shared_schema','raw_employee_salary')}}
)
select * from tb1