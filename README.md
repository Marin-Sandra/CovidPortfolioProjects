# COVID-19 Global Data Exploration with SQL

This project performs exploratory data analysis (EDA) on global COVID-19 data using **SQL Server**.
The focus is on understanding the progression of cases, deaths, and vaccinations across different countries and continents.


## Objective

To explore and analyze real-world pandemic data using **T-SQL** to derive insights such as:
- Infection rates
- Death percentages
- Vaccination progress
- Impact comparison across locations and time

This project is aimed at practicing SQL skills in data aggregation, filtering, joins, CTEs, window functions, and views.


## Dataset Overview

The project uses two main datasets:
- **CovidDeaths**: Contains information about total cases, deaths, population, etc.
- **CovidVaccinations**: Contains daily vaccination counts.

These datasets include country-level daily records with the following key fields:
- `location`, `date`, `total_cases`, `total_deaths`, `population`
- `new_cases`, `new_deaths`, `new_vaccinations`


##  Tools & Technologies

- Microsoft SQL Server (SSMS)
- T-SQL (Transact-SQL)
- GitHub
- CSV Data Source (from [Our World in Data](https://ourworldindata.org/coronavirus-source-data))


## SQL Tasks Performed

### Basic Exploration
- Selected data with filters (e.g. excluding aggregates like continents)
- Sorted and organized case data by date and location

### Key Metrics Calculated
- **Death Percentage** = (Total Deaths / Total Cases) × 100  
- **Infection Rate** = (Total Cases / Population) × 100  
- **Rolling Vaccination Totals** using `SUM() OVER()`  
- **Country with Highest Infection Rate**  
- **Continent with Most Deaths**

### Grouped Analysis
- Daily trends across the world (`GROUP BY date`)
- Total deaths and cases per continent and location
- Rolling total vaccinations via a **CTE**

### View Creation
- Created a reusable **SQL View**: `PercentPopulationVaccinated`  
  To simplify queries for country-level vaccination progress.


## Sample Insights

- India had a peak death percentage of ~1.3%.
- Some countries had over 10% of their population infected at peak.
- Cumulative vaccinations in India reached over 75% of the population based on available data.


