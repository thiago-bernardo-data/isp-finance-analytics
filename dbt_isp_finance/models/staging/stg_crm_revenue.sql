{{ config(materialized='view') }}

SELECT
    customer_id,
    month,
    revenue AS crm_revenue

FROM read_csv_auto(
    'C:/Projects/isp-finance-analytics/data/raw/crm_revenue.csv'
)