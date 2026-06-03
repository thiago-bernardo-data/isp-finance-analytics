{{ config(materialized='view') }}

SELECT
    customer_id,
    month,
    revenue AS billing_revenue

FROM read_csv_auto(
    'C:/Projects/isp-finance-analytics/data/raw/billing_revenue.csv'
)