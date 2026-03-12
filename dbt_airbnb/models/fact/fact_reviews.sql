{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    incremental_predicates = ["review_date > (select max(review_date) from {{ this }})"]
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null

{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}

        -- incremental_strategy = 'merge',
        -- file_format = 'parquet',
        -- partition_by = {'field': 'review_date', 'data_type': 'date'},
        -- The incremental_predicates argument is used to filter the records processed during incremental runs.
        -- For example, to only process records where the review_date is newer than the latest already loaded:
        -- incremental_predicates = ["review_date > (select max(review_date) from {{ this }})"]
        -- post_hook = [],
        -- tags = ['incremental', 'fact']

