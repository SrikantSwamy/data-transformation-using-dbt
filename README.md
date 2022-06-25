# data-transformation-using-dbt
Data Pipeline Using DBT

### Description

Marketing's team ask is to create denormalized tables trips, zones and monthly revenue aggregate table.\
The EL process loads the staging tables which are sources for the transform phase. Final tables are built using dbt.
Below are the steps:
1. dbt reads the source tables (staging - 1), performs transformation and creates intermediate tables (staging - 2) 
2. Finally, dbt creates final tables dim_zones, fact_trips, and montly zone revenue.

![dbt_flow](https://user-images.githubusercontent.com/40203363/175792810-bde2d973-490a-4984-a082-18397916b4d8.jpg)

### Prerequisites

1. dbt
2. Docker Compose


