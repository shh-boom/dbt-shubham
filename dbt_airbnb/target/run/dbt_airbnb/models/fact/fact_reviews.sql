
      insert into "postgres"."dev"."fact_reviews" ("listing_id", "review_date", "reviewer_name", "review_text", "review_sentiment")
    (
        select "listing_id", "review_date", "reviewer_name", "review_text", "review_sentiment"
        from "fact_reviews__dbt_tmp132931139205"
    )


  