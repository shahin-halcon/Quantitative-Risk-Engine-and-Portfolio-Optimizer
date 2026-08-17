# 1. Install & Load Libraries
# (Run the install line once if you don't have yfR)
install.packages(c("yfR", "tidyverse", "tidyquant", "PerformanceAnalytics"))

library(yfR)
library(tidyverse)
library(tidyquant)
library(PerformanceAnalytics)

# 2. Define Tickers
tickers <- c("AAPL", "MSFT", "NVDA", "AMZN", "GOOGL")

# 3. Fetch Live API Data using the robust 'yfR' package
cat("Fetching live data from Yahoo Finance... (This takes a few seconds)\n")

live_stock_data <- yf_get(
  tickers = tickers,
  first_date = "2023-01-01",
  last_date = Sys.Date()
)

# 4. Standardize the columns so it perfectly matches our risk engine
live_stock_data <- live_stock_data %>%
  select(symbol = ticker, date = ref_date, adjusted = price_adjusted)

# 5. Calculate Daily Log Returns (Pure dplyr - No extra dependencies required)
stock_returns <- live_stock_data %>%
  group_by(symbol) %>%
  arrange(date) %>%
  mutate(daily_return = log(adjusted / lag(adjusted))) %>%
  drop_na(daily_return) # Remove the first row per stock where lag() is NA

# 6. Compute Financial Risk Metrics
portfolio_risk_summary <- stock_returns %>%
  group_by(symbol) %>%
  summarise(
    avg_daily_return = mean(daily_return, na.rm = TRUE),
    annualized_return = (1 + avg_daily_return)^252 - 1,
    annualized_volatility = sd(daily_return, na.rm = TRUE) * sqrt(252),
    sharpe_ratio = annualized_return / annualized_volatility,
    var_95 = quantile(daily_return, 0.05, na.rm = TRUE) 
  ) %>%
  arrange(desc(sharpe_ratio))

# Print the risk metrics summary to console
print(portfolio_risk_summary)