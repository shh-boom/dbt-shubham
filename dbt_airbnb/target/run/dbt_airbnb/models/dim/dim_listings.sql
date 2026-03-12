
  
    

  create  table "postgres"."dev"."dim_listings__dbt_tmp"
  
  
    as
  
  (
    
WITH src_listings AS (
    SELECT * FROM "postgres"."dev"."src_listings"
)
SELECT
  listing_id,
  listing_name,
  room_type,
  CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
  END AS minimum_nights,
  host_id,
  REPLACE(REPLACE(price_str::TEXT, '$', ''), ',', '')::NUMERIC(10,2) AS price,
  created_at,
  updated_at
FROM
  src_listings
  );
  