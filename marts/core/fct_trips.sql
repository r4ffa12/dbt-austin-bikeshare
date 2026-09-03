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

        trip_date,

        start_at,

        end_at,

        duration_minutes,

        subscriber_type,

        bike_type,

        start_station_name,

        end_station_name,

        trip_year,

        trip_month,

        day_of_week,

        start_hour,

        time_period,

        duration_category

    FROM trips

)

SELECT *
FROM final