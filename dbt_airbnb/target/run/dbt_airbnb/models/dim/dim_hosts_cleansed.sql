
  create view "postgres"."dev"."dim_hosts_cleansed__dbt_tmp"
    
    
  as (
    
WITH  __dbt__cte__src_hosts as (
WITH raw_hosts AS (
    SELECT
        *
    FROM
       RAW.RAW_HOSTS
)
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
), src_hosts AS (
    SELECT * FROM __dbt__cte__src_hosts
)
SELECT
    host_id,
    COALESCE(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
  );