WITH trips AS (

    SELECT *
    FROM {{ ref('int_bikeshare_trips') }}

),

final AS (

    SELECT

        trip_id,

        bike_id,

        start_station_id,

        end_station_id,

        start_station_name,

        end_station_name,

        trip_date,

        trip_year,

        trip_month,

        day_of_week,

        start_hour,

        time_period,

        duration_minutes,

        duration_category,

        subscriber_type,

        bike_type

    FROM trips

)

SELECT *
FROM final