{{ config(materialized='view') }}

SELECT
    market_id,
    market_name,
    state

FROM read_csv_auto(
    'C:/Projects/isp-finance-analytics/data/raw/markets.csv'
)