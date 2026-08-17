# Live Quantitative Risk Engine & Portfolio Optimizer 📈

## 📌 Project Overview
This project is an end-to-end quantitative analytics pipeline. Instead of relying on static CSV files, this tool dynamically connects to the Yahoo Finance API to pull live market data, calculates institutional risk metrics, and runs a 10,000-run Monte Carlo simulation to mathematically determine the optimal capital allocation across major tech equities.

## 🛠️ Tech Stack
* **Language:** R
* **Libraries:** `yfR` (API Ingestion), `dplyr` / `tidyverse` (Data Wrangling), `ggplot2` (Statistical Plotting)
* **Visualization:** Tableau (Executive Dashboarding)

## ⚙️ Methodology
1. **Live Data Pipeline:** Ingested daily adjusted closing prices for AAPL, MSFT, NVDA, AMZN, and GOOGL from 2023 to the current date.
2. **Risk & Return Metrics:** Transformed absolute prices into Daily Log Returns and calculated Annualized Volatility, 95% Historical Value-at-Risk (VaR), and Sharpe Ratios.
3. **Monte Carlo Simulation:** Generated 10,000 random portfolio weight combinations to construct a Markowitz Efficient Frontier.
4. **Optimization:** Algorithmically isolated the Maximum Sharpe Ratio Portfolio to find the optimal risk-vs-reward investment recipe.

## 📊 Key Findings & Results
The algorithm completely contradicted standard human intuition (equal-weight distribution). To achieve the maximum possible return per unit of risk, the 10,000-run simulation identified the following optimal allocation:
* **NVDA:** 65.8% (Explosive Growth Driver)
* **GOOGL:** 24.1% (Non-Correlated Stability Anchor)
* **AMZN:** 6.9%
* **MSFT:** 1.8%
* **AAPL:** 1.2%

**Optimal Portfolio Performance:**
* Expected Annual Return: **86.7%**
* Annualized Risk (Volatility): **36.6%**
* Sharpe Ratio: **2.37**

## 🚀 How to Run the Code
1. Clone this repository.
2. Open `portfolio_risk_engine.R` in RStudio.
3. Run the script. The `yfR` package will automatically connect to Yahoo Finance and pull the latest data as of today's date.
4. The script will output the optimal weights to the console and generate the Efficient Frontier plot.
