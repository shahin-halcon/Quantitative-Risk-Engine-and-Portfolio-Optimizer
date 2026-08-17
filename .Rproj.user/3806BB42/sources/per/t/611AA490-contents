# ---------------------------------------------------------
# EXPORT DATASETS FOR TABLEAU DASHBOARDING
# ---------------------------------------------------------

# 1. Prepare time-series data with calculated cumulative growth
tableau_time_series <- stock_returns %>%
  group_by(symbol) %>%
  arrange(date) %>%
  mutate(growth = cumprod(1 + daily_return)) %>%
  ungroup()

# 2. Export both datasets to CSV using tidyverse's write_csv
write_csv(tableau_time_series, "tableau_stock_time_series.csv")
write_csv(portfolio_risk_summary, "tableau_portfolio_risk_summary.csv")

cat("Successfully exported files for Tableau:\n",
    "1. tableau_stock_time_series.csv\n",
    "2. tableau_portfolio_risk_summary.csv\n")