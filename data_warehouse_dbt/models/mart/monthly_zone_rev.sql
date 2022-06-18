{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('fact_trips') }}
)
    select 
    pickup_zn as rev_zone,
    date_trunc('month', pickup_dttime) as rev_month,  
    service_type, 
    sum(fare_amt) as rev_monthly_fare,
    sum(extra) as rev_monthly_extra,
    sum(mta_tax) as rev_monthly_mta_tax,
    sum(tip_amt) as rev_monthly_tip_amt,
    sum(tolls_amt) as rev_monthly_tolls_amt,
    sum(ehail_fee) as rev_monthly_ehail_fee,
    sum(improvement_surcharge) as rev_monthly_improv_surcharge,
    sum(total_amt) as rev_monthly_tot_amt,
    sum(congestion_surcharge) as rev_monthly_congn_surcharge,
    count(tripid) as total_monthly_trips,
    avg(passenger_cnt) as avg_montly_passenger_cnt,
    avg(trip_distance) as avg_montly_trip_distance
    from trips_data
    group by 1,2,3

