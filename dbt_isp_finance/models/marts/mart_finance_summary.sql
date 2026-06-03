{{ config(materialized='table') }}

SELECT

    month,

    COUNT(DISTINCT customer_id) AS total_customers,

    ROUND(SUM(crm_revenue), 2) AS total_crm_revenue,
    ROUND(SUM(billing_revenue), 2) AS total_billing_revenue,
    ROUND(SUM(gl_revenue), 2) AS total_gl_revenue,

    ROUND(SUM(crm_vs_gl_variance), 2) AS total_variance,

    ROUND(
        (SUM(crm_vs_gl_variance) / NULLIF(SUM(gl_revenue),0))*100,
        2
    ) AS variance_pct,

    ROUND(
        SUM(gl_revenue)
        /
        COUNT(DISTINCT customer_id),
        2
    ) AS arpu

FROM {{ ref('int_revenue_reconciliation') }}

GROUP BY month