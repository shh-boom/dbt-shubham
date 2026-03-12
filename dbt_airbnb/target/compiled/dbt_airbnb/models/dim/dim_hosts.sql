
WITH src_hosts AS (
    SELECT * FROM "postgres"."dev"."src_hosts"
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