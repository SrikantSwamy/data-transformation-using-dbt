CREATE SCHEMA IF NOT EXISTS warehouse;
DROP TABLE IF EXISTS warehouse.trip_data_green;

CREATE TABLE warehouse.trip_data_green 
(
    VendorID INTEGER, 
    lpep_pickup_datetime DATE, 
    lpep_dropoff_datetime DATE,
    store_and_fwd_flag VARCHAR(1), 
    RatecodeID NUMERIC, 
    PULocationID INTEGER, 
    DOLocationID INTEGER,
    passenger_count NUMERIC, 
    trip_distance NUMERIC, 
    fare_amount NUMERIC, 
    extra NUMERIC, 
    mta_tax NUMERIC,
    tip_amount NUMERIC, 
    tolls_amount NUMERIC, 
    ehail_fee NUMERIC, 
    improvement_surcharge NUMERIC,
    total_amount NUMERIC, 
    payment_type NUMERIC, 
    trip_type NUMERIC, 
    congestion_surcharge NUMERIC
);

DROP TABLE IF EXISTS warehouse.trip_data_yellow;
CREATE TABLE warehouse.trip_data_yellow
(
    VendorID INTEGER, 
    tpep_pickup_datetime DATE, 
    tpep_dropoff_datetime DATE,
    passenger_count NUMERIC, 
    trip_distance NUMERIC, 
    RatecodeID NUMERIC, 
    store_and_fwd_flag VARCHAR(1), 
    PULocationID INTEGER, 
    DOLocationID INTEGER,
    payment_type NUMERIC, 
    fare_amount NUMERIC, 
    extra NUMERIC, 
    mta_tax NUMERIC,
    tip_amount NUMERIC, 
    tolls_amount NUMERIC, 
    improvement_surcharge NUMERIC,
    total_amount NUMERIC, 
    congestion_surcharge NUMERIC 
);

DROP TABLE IF EXISTS warehouse.taxi_zone_lookup;
CREATE TABLE warehouse.taxi_zone_lookup 
(
    LocationID INTEGER, 
    Borough VARCHAR(255), 
    Zone VARCHAR(255), 
    service_zone VARCHAR(255)
);

COPY stg_trip_data_green
FROM '/input_data/green_tripdata_2022-02.csv'
DELIMITER ','
CSV HEADER;

COPY stg_trip_data_yellow
FROM '/input_data/yellow_tripdata_2022-02.csv'
DELIMITER ','
CSV HEADER;




