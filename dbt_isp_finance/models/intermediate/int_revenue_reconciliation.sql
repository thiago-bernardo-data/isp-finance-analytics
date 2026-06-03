{{ config(materialized='table') }}

SELECT
    c.customer_id,
    c.customer_name,
    c.customer_type,
    c.status,

    m.market_name,
    m.state,

    crm.month,

    crm.crm_revenue,
    b.billing_revenue,
    gl.gl_revenue,

    crm.crm_revenue - b.billing_revenue
        AS crm_vs_billing_variance,

    b.billing_revenue - gl.gl_revenue
        AS billing_vs_gl_variance,

    crm.crm_revenue - gl.gl_revenue
        AS crm_vs_gl_variance,

    CASE
        WHEN gl.gl_revenue = 0 THEN NULL
        ELSE ROUND(
            (
                (crm.crm_revenue - gl.gl_revenue)
                / gl.gl_revenue
            ) * 100,
            2
        )
    END AS crm_vs_gl_variance_pct

FROM {{ ref('stg_crm_revenue') }} crm

LEFT JOIN {{ ref('stg_billing_revenue') }} b
    ON crm.customer_id = b.customer_id
   AND crm.month = b.month

LEFT JOIN {{ ref('stg_gl_revenue') }} gl
    ON crm.customer_id = gl.customer_id
   AND crm.month = gl.month

LEFT JOIN {{ ref('stg_customers') }} c
    ON crm.customer_id = c.customer_id

LEFT JOIN {{ ref('stg_markets') }} m
    ON c.market_id = m.market_id