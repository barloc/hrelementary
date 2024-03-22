{{
    config(
        incremental_strategy = 'delete+insert',
        materialized = 'incremental',
        order_by_string = 'schema_name,name,dbt_run_at',
        transient = False,
        unique_key = 'result_id',
    )
}}

with empty_table as (
   select
       null::varchar(512) as result_id,
       null::varchar(64) as invocation_id,
       null::varchar(512) as unique_id,
       null::varchar(32) as database_name,
       null::varchar(64) as schema_name,
       null::varchar(512) as name,
       null::varchar(64) as resource_type,
       null::varchar(64) as status,
       cast(null as float) as execution_time_seconds,
       cast(null as int) as rows_affected,
       cast(null as timestamp) as dbt_run_at,
       null::varchar(128) as selector
)

select * from empty_table
-- This is a filter so we will never actually insert these values
where 1 = 0
