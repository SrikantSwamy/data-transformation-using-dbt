{{ config(materialized='table') }}

with dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
), 
cte_yellow as (
    select *, 
        'Yellow' as service_type
    from {{ ref('stg_trip_data_yellow') }}
), 
cte_green as (
    select *, 
        'Green' as service_type 
    from {{ ref('stg_trip_data_green') }}
), 
cte_union as (
    select * from cte_yellow
    union all
    select * from cte_green
)
select 
    cte_union.tripid, 
    cte_union.vendorid, 
    cte_union.service_type,
    cte_union.ratecodeid, 
    cte_union.pickup_locationid, 
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zn, 
    cte_union.dropoff_locationid,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zn,  
    cte_union.pickup_datetime as pickup_dttime, 
    cte_union.dropoff_datetime as dropoff_dttime, 
    cte_union.store_and_fwd_flag, 
    cte_union.passenger_count as passenger_cnt, 
    cte_union.trip_distance, 
    cte_union.trip_type, 
    cte_union.fare_amount as fare_amt, 
    cte_union.extra, 
    cte_union.mta_tax, 
    cte_union.tip_amount as tip_amt, 
    cte_union.tolls_amount as tolls_amt, 
    cte_union.ehail_fee, 
    cte_union.improvement_surcharge, 
    cte_union.total_amount as total_amt, 
    cte_union.payment_type, 
    cte_union.payment_type_description as payment_type_descr, 
    cte_union.congestion_surcharge
from cte_union
inner join dim_zones as pickup_zone
on cte_union.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on cte_union.dropoff_locationid = dropoff_zone.locationid