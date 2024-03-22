{{
    config(
        incremental_strategy = 'delete+insert',
        materialized = 'incremental',
        transient = False,
        unique_key = 'result_id',
    )
}}

with empty_table as (
   select
       null::varchar(255) as result_id,
       null::varchar(255) as invocation_id,
       null::varchar(255) as unique_id,
       null::varchar(255) as database_name,
       null::varchar(255) as schema_name,
       null::varchar(255) as name,
       null::varchar(255) as resource_type,
       null::varchar(255) as status,
       cast(null as float) as execution_time_seconds,
       cast(null as int) as rows_affected,
       cast(null as timestamp) as dbt_run_at
)

select * from empty_table
-- This is a filter so we will never actually insert these values
where 1 = 0
