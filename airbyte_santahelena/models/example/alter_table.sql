
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select
        'ALTER TABLE ' || table_name || ' ALTER COLUMN ' || column_name || ' TYPE timestamp with time zone USING  ' ||         column_name || '::timestamp with time zone;'
from
    information_schema.columns
where
    column_name like 'd%'
    and column_name like 'mc1lastupdate%'
    and table_schema = 'public'
    

)

select *
from source_data