{{ config(materialized='view') }}

SELECT
    customer_id,
    month,
    churn_flag

FROM read_csv_auto(
    'C:/Projects/isp-finance-analytics/data/raw/churn_events.csv'
)