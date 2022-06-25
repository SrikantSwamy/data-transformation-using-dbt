# data-transformation-using-dbt
ELT Data Pipeline Using DBT

### Description

Marketing's team ask is to create denormalized tables trips, zones and monthly revenue aggregate table.\
The EL process loads the staging tables which are sources for the transform phase (T). Final tables are built using dbt.
Below are the steps:
1. dbt reads the source tables (staging - 1), performs transformation and creates intermediate tables (staging - 2) 
2. Finally, dbt creates final tables dim_zones, fact_trips, and montly zone revenue.

![dbt_flow](https://user-images.githubusercontent.com/40203363/175792810-bde2d973-490a-4984-a082-18397916b4d8.jpg)

### Dataset

https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page

### Prerequisites

1. dbt (dbt-core and dbt-postgres)
2. Docker Compose

### Steps to re-produce this project:

### Run Docker Compose

Clone this Git Repo and run Docker compose. This will bring up PostgreSQL and pgadmin4 (client)\
The initialize step present (initial_setup.sql) in the docker comppose will load the source tables (staging - 1): trip_data_green, trip_data_yellow, and taxi_zone_lookup

```
cd data-transformation-using-dbt
docker-compose up
```

### Run DBT

```
dbt run --profiles-dir /Users/srikantswamy/Documents/projects/data-transformation-using-dbt
```

Once DBT sucessfully runs, you will see below output:

```
env) (base) MacBook-Air:data_warehouse_dbt srikantswamy$ dbt run --profiles-dir /Users/srikantswamy/Documents/projects/data-transformation-using-dbt
21:55:53  Running with dbt=1.0.5
21:55:53  [WARNING]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- seeds.data_warehouse_dbt.taxi_zone_lookup

21:55:53  Found 5 models, 7 tests, 0 snapshots, 0 analyses, 403 macros, 0 operations, 0 seed files, 3 sources, 0 exposures, 0 metrics
21:55:53  
21:55:53  Concurrency: 1 threads (target='dev')
21:55:53  
21:55:53  1 of 5 START table model warehouse.dim_zones.................................... [RUN]
21:55:54  1 of 5 OK created table model warehouse.dim_zones............................... [SELECT 265 in 0.24s]
21:55:54  2 of 5 START view model warehouse.stg_trip_data_green........................... [RUN]
21:55:54  2 of 5 OK created view model warehouse.stg_trip_data_green...................... [CREATE VIEW in 0.19s]
21:55:54  3 of 5 START view model warehouse.stg_trip_data_yellow.......................... [RUN]
21:55:54  3 of 5 OK created view model warehouse.stg_trip_data_yellow..................... [CREATE VIEW in 0.11s]
21:55:54  4 of 5 START table model warehouse.fact_trips................................... [RUN]
21:56:48  4 of 5 OK created table model warehouse.fact_trips.............................. [SELECT 156 in 54.11s]
21:56:48  5 of 5 START table model warehouse.monthly_zone_rev............................. [RUN]
21:56:48  5 of 5 OK created table model warehouse.monthly_zone_rev........................ [SELECT 98 in 0.24s]
21:56:48  
21:56:48  Finished running 3 table models, 2 view models in 55.23s.
21:56:48  
21:56:48  Completed successfully
21:56:48  
21:56:48  Done. PASS=5 WARN=0 ERROR=0 SKIP=0 TOTAL=5

```

### Check final tables

Check the tables in pgadmin4 client if they are populated.\
These tables are now ready to be consumed by the marketing team.
