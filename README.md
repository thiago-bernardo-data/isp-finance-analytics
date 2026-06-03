# ISP Finance Analytics — Revenue Reconciliation Dashboard

## Overview

This project simulates a Finance Analytics environment for an Internet Service Provider (ISP), inspired by Ting Internet.

The goal is to reconcile revenue across multiple operational and financial systems, including CRM, Billing, and General Ledger, and provide Finance leadership with trusted executive metrics through a self-service dashboard.

The solution was built using Python, DuckDB, dbt, and Looker Studio.

## Business Problem

In telecom and ISP businesses, revenue often exists across multiple systems:

- CRM captures customer and service activity.
- Billing captures invoicing and charges.
- General Ledger captures officially recognized financial revenue.

Because these systems serve different business purposes, revenue numbers may not always match.

Finance teams need a trusted process to identify discrepancies, quantify variances, and understand whether differences are financially material.

## Architecture

The project follows a layered analytics engineering structure:
```text
Raw CSV Data
↓
dbt Staging Models
↓
Revenue Reconciliation Layer
↓
Finance Mart
↓
Looker Studio Dashboard
↓
Future Claude / AI Agent Enablement
```
## Architecture Diagram

![Architecture Diagram](documentation/architecture_diagram.png)

## Tech Stack

- Python — simulated ISP finance datasets
- DuckDB — local analytical database
- dbt Core — data modeling and transformation
- Looker Studio — executive dashboard
- Google Sheets — dashboard data source
- VS Code — development environment

## Data Sources

The project uses simulated datasets representing common ISP business systems:

| Dataset | Description |
|---|---|
| customers.csv | Customer master data |
| markets.csv | ISP market and state information |
| crm_revenue.csv | Operational revenue from CRM |
| billing_revenue.csv | Invoiced revenue from Billing |
| gl_revenue.csv | Recognized revenue from General Ledger |
| churn_events.csv | Customer churn indicators |

## dbt Models

The project follows a layered dbt architecture that separates ingestion, business logic and reporting.

### Staging Models

Raw source standardization.

- stg_customers
- stg_markets
- stg_crm_revenue
- stg_billing_revenue
- stg_gl_revenue
- stg_churn_events

### Intermediate Model

Revenue reconciliation logic.

- int_revenue_reconciliation

This model joins CRM, Billing and General Ledger revenue and calculates revenue variances across systems.

### Mart Models

Executive reporting layer.

- mart_finance_revenue
- mart_finance_summary

These models aggregate revenue data into executive KPIs and dashboard-ready metrics.

## Key Metrics

The Finance Mart calculates the following business metrics:

### Total Revenue

General Ledger revenue aggregated by market.

### Customer Count

Distinct active customers.

### ARPU (Average Revenue Per User)

Calculated as:

Revenue / Customers

### CRM vs GL Variance ($)

Difference between CRM revenue and General Ledger revenue.

### Finance Variance (%)

Percentage difference between CRM and General Ledger revenue.

Used to identify potential timing differences, revenue recognition issues or process inconsistencies.

## Executive Dashboard

The dashboard was designed for Finance leadership and executive stakeholders.

## Dashboard Preview

![Dashboard](documentation/dashboard_final.png)

### KPI Cards

- Revenue
- Customers
- ARPU
- Finance Variance %

### Revenue by Market

Identifies the highest and lowest revenue generating markets.

### Finance Variance by Market

Highlights markets where operational and financial revenue differ.

### Revenue Reconciliation Detail

Provides market-level comparison of revenue, ARPU and variance metrics.

## Key Insights

The reconciliation analysis identified several revenue discrepancies across markets.

### Charlottesville

Charlottesville showed the highest positive CRM-to-GL variance (+0.67%), suggesting potential timing differences or revenue recognition discrepancies requiring Finance review.

### Wake Forest

Wake Forest showed the largest negative variance (-0.31%), indicating that CRM revenue was lower than General Ledger revenue.

### Revenue Alignment

Despite these discrepancies, all markets remained below 1% variance, suggesting strong alignment between operational and financial reporting systems.

## Business Impact

This solution provides Finance leadership with:

- Trusted revenue reporting
- Cross-system reconciliation visibility
- Faster discrepancy identification
- Executive-level KPI reporting
- Self-service analytics capabilities

The reconciliation framework enables Finance teams to proactively monitor revenue quality and investigate variances before they become financially material.

## Future Enhancements

### Phase 2

Churn Financial Impact Dashboard

### Phase 3

Revenue Forecasting

### Phase 4

Looker Semantic Layer

### Phase 5

Claude Finance Assistant (MCP Integration)

Enable executives to ask business questions in natural language against trusted Finance metrics.