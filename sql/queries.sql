-- Top 5 Funds by AUM

SELECT scheme_name,aum_crore
FROM fact_performance
ORDER BY aum_crore DESC
LIMIT 5;

-- Average NAV Per Month

SELECT strftime('%Y-%m',date) AS month,
AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY month;

-- SIP Transactions

SELECT COUNT(*)
FROM fact_transactions
WHERE transaction_type='SIP';

-- Transactions by State

SELECT state,
COUNT(*) total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- Funds with Expense Ratio < 1%

SELECT scheme_name,
expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1;

-- Top 5 Fund Houses by Number of Schemes

SELECT fund_house,
COUNT(*) AS scheme_count
FROM dim_fund
GROUP BY fund_house
ORDER BY scheme_count DESC
LIMIT 5;

-- Average Return by Category

SELECT category,
AVG(return_3yr_pct) AS avg_return
FROM fact_performance fp
JOIN dim_fund df
ON fp.amfi_code = df.amfi_code
GROUP BY category;

-- KYC Status Distribution

SELECT kyc_status,
COUNT(*) AS total
FROM fact_transactions
GROUP BY kyc_status;

-- Transaction Type Distribution

SELECT transaction_type,
COUNT(*) AS total
FROM fact_transactions
GROUP BY transaction_type;

-- Top 10 Cities by Transaction Volume

SELECT city,
SUM(amount_inr) AS total_amount
FROM fact_transactions
GROUP BY city
ORDER BY total_amount DESC
LIMIT 10;