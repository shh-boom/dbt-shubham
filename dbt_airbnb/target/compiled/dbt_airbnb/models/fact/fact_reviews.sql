
WITH  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT
        *
    FROM
        RAW.RAW_REVIEWS
)
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews
), src_reviews AS (
  SELECT * FROM __dbt__cte__src_reviews
)
SELECT * FROM src_reviews
WHERE review_text is not null


  AND review_date > (select max(review_date) from "postgres"."dev"."fact_reviews")


        -- incremental_strategy = 'merge',
        -- file_format = 'parquet',
        -- partition_by = {'field': 'review_date', 'data_type': 'date'},
        -- The incremental_predicates argument is used to filter the records processed during incremental runs.
        -- For example, to only process records where the review_date is newer than the latest already loaded:
        -- incremental_predicates = ["review_date > (select max(review_date) from "postgres"."dev"."fact_reviews")"]
        -- post_hook = [],
        -- tags = ['incremental', 'fact']