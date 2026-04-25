Welcome to my first dbt E-commerce project!

### This project builds an end-to-end analytic pipeline on a e-commerce dataset using DuckDB, Dbt and PowerBI


It checks the dataset on kaggle;
It contains 90k lines and 5 tables : orders - orders items - payments - products and customers

###  Goals of this project 
- Load raw e-commerce data
- Clean and transform data with dbt
- Build analytics-ready data marts with DBT
- See my transformations on Duck DB
- Visualize key KPIs in Power BI

## Tech Stack
- DuckDB
- dbt
- SQL
- Power BI

To update my Azure skills, i use Azure  to create a Virtual Machine on which I installed PowerBI for visualition

## Project Structure
- `models/staging/` : cleaned staging models
- `models/intermediate/` : intermediate transformations
- `models/marts/` : final data marts
- `tests/` : data quality tests
- `seeds/` : static files if needed

## How to Run
```bash
dbt debug
dbt run
dbt test
