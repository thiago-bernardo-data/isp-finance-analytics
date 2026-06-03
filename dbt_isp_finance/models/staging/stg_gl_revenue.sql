{{ config(materialized='view') }}

SELECT
    customer_id,
    month,
    revenue AS gl_revenue

FROM read_csv_auto(
    'C:/Projects/isp-finance-analytics/data/raw/gl_revenue.csv'
)