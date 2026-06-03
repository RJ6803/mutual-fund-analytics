# Mutual Fund Analytics Data Dictionary

## Project Overview

This document describes all datasets used in the Mutual Fund Analytics project. It includes column names, data types, business definitions, and source references.

---

# 01_fund_master.csv

**Description:** Master reference dataset containing details of all mutual fund schemes.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| amfi_code | Integer | Unique AMFI scheme identifier |
| fund_house | Text | Name of the Asset Management Company (AMC) |
| scheme_name | Text | Name of the mutual fund scheme |
| category | Text | Broad fund category |
| sub_category | Text | Detailed fund classification |
| plan | Text | Direct or Regular plan |
| launch_date | Date | Scheme launch date |
| benchmark | Text | Benchmark index used for performance comparison |
| expense_ratio_pct | Float | Annual expense ratio (%) |
| exit_load_pct | Float | Exit load charged on redemption (%) |
| min_sip_amount | Integer | Minimum SIP investment amount |
| min_lumpsum_amount | Integer | Minimum lump sum investment amount |
| fund_manager | Text | Fund manager name |
| risk_category | Text | Risk classification of scheme |
| sebi_category_code | Text | SEBI category code |

**Source:** AMFI Fund Master Data

---

# 02_nav_history.csv

**Description:** Historical Net Asset Value (NAV) records of mutual fund schemes.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| amfi_code | Integer | Unique scheme identifier |
| date | Date | NAV reporting date |
| nav | Float | Net Asset Value of the scheme |

**Source:** AMFI Historical NAV Data

---

# 03_aum_by_fund_house.csv

**Description:** Assets Under Management (AUM) statistics at fund house level.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| date | Date | Reporting date |
| fund_house | Text | Mutual fund company |
| aum_lakh_crore | Float | AUM expressed in lakh crore rupees |
| aum_crore | Float | AUM expressed in crore rupees |
| num_schemes | Integer | Number of schemes managed by the fund house |

**Source:** AMFI Industry AUM Reports

---

# 04_monthly_sip_inflows.csv

**Description:** Monthly SIP industry statistics.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| month | Date | Reporting month |
| sip_inflow_crore | Float | Total SIP inflows (crore ₹) |
| active_sip_accounts_crore | Float | Number of active SIP accounts (crore) |
| new_sip_accounts_lakh | Float | Number of new SIP accounts opened (lakh) |
| sip_aum_lakh_crore | Float | SIP assets under management (lakh crore ₹) |
| yoy_growth_pct | Float | Year-over-year SIP growth percentage |

**Source:** AMFI Monthly SIP Reports

---

# 05_category_inflows.csv

**Description:** Category-wise mutual fund net inflows and outflows.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| month | Date | Reporting month |
| category | Text | Fund category |
| net_inflow_crore | Float | Net inflow or outflow amount (crore ₹) |

**Source:** AMFI Category Flow Reports

---

# 06_industry_folio_count.csv

**Description:** Industry-wide folio statistics across mutual fund categories.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| month | Date | Reporting month |
| total_folios_crore | Float | Total investor folios (crore) |
| equity_folios_crore | Float | Equity fund folios (crore) |
| debt_folios_crore | Float | Debt fund folios (crore) |
| hybrid_folios_crore | Float | Hybrid fund folios (crore) |
| others_folios_crore | Float | Other category folios (crore) |

**Source:** AMFI Industry Folio Reports

---

# 07_scheme_performance.csv

**Description:** Mutual fund performance, risk, and rating metrics.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| amfi_code | Integer | Unique scheme identifier |
| scheme_name | Text | Scheme name |
| fund_house | Text | Asset management company |
| category | Text | Fund category |
| plan | Text | Direct or Regular plan |
| return_1yr_pct | Float | One-year annualized return (%) |
| return_3yr_pct | Float | Three-year annualized return (%) |
| return_5yr_pct | Float | Five-year annualized return (%) |
| benchmark_3yr_pct | Float | Three-year benchmark return (%) |
| alpha | Float | Excess return over benchmark |
| beta | Float | Sensitivity to market movement |
| sharpe_ratio | Float | Risk-adjusted return measure |
| sortino_ratio | Float | Downside-risk-adjusted return |
| std_dev_ann_pct | Float | Annualized standard deviation (%) |
| max_drawdown_pct | Float | Maximum decline from peak (%) |
| aum_crore | Float | Assets under management (crore ₹) |
| expense_ratio_pct | Float | Annual expense ratio (%) |
| morningstar_rating | Integer | Morningstar rating (1–5) |
| risk_grade | Text | Overall risk grade |

**Source:** Mutual Fund Performance Dataset

---

# 08_investor_transactions.csv

**Description:** Investor transaction activity data.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| investor_id | Text | Unique investor identifier |
| transaction_date | Date | Transaction date |
| amfi_code | Integer | Mutual fund scheme code |
| transaction_type | Text | SIP, Lumpsum, or Redemption |
| amount_inr | Float | Transaction amount in INR |
| state | Text | Investor state |
| city | Text | Investor city |
| city_tier | Text | City tier classification |
| age_group | Text | Investor age group |
| gender | Text | Investor gender |
| annual_income_lakh | Float | Annual income (lakh ₹) |
| payment_mode | Text | Payment method used |
| kyc_status | Text | KYC verification status |

**Source:** Investor Transactions Dataset

---

# 09_portfolio_holdings.csv

**Description:** Portfolio holdings of mutual fund schemes.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| amfi_code | Integer | Scheme identifier |
| stock_symbol | Text | Stock ticker symbol |
| stock_name | Text | Company/stock name |
| sector | Text | Sector classification |
| weight_pct | Float | Portfolio weight percentage |
| market_value_cr | Float | Market value in crore rupees |
| current_price_inr | Float | Current stock price (₹) |
| portfolio_date | Date | Portfolio disclosure date |

**Source:** Mutual Fund Portfolio Disclosure Data

---

# 10_benchmark_indices.csv

**Description:** Historical benchmark index values.

| Column Name | Data Type | Business Definition |
|------------|------------|--------------------|
| date | Date | Trading date |
| index_name | Text | Benchmark index name |
| close_value | Float | Closing value of index |

**Source:** NSE/BSE Benchmark Data

---

# Data Quality & Cleaning Summary

1. Converted date columns to datetime format.
2. Sorted NAV data by AMFI code and date.
3. Forward-filled missing NAV values where applicable.
4. Removed duplicate records.
5. Validated NAV values greater than zero.
6. Standardized transaction types (SIP, Lumpsum, Redemption).
7. Validated transaction amounts greater than zero.
8. Checked KYC status values for consistency.
9. Converted performance metrics to numeric format.
10. Validated expense ratio range between 0.1% and 2.5%.
11. Verified AMFI codes across datasets.
12. Loaded cleaned datasets into SQLite database.
13. Verified database row counts against source files.

---

# Database Information

**Database Name:** `bluestock_mf.db`

## Dimension Tables

- dim_fund
- dim_date

## Fact Tables

- fact_nav
- fact_transactions
- fact_performance
- fact_aum

## Database Type

SQLite Star Schema Data Warehouse

---