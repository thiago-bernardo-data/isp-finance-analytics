{{ config(materialized='view') }}

SELECT
    customer_id,
    customer_name,
    market_id,
    customer_type,
    status

FROM read_csv_auto(
    'C:/Projects/isp-finance-analytics/data/raw/customers.csv'
)