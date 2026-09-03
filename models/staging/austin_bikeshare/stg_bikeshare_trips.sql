WITH source AS (

    SELECT *
    FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}

),

renamed AS (

    SELECT

        CAST(trip_id AS STRING) AS trip_id,

        CAST(bike_id AS STRING) AS bike_id,

        CAST(start_station_id AS INT64) AS start_station_id,

        CAST(end_station_id AS INT64) AS end_station_id,

        CAST(start_time AS TIMESTAMP) AS start_at,

        CAST(duration_minutes AS INT64) AS duration_minutes,

        COALESCE(
            NULLIF(TRIM(CAST(subscriber_type AS STRING)), ''),
            'Unknown'
        ) AS subscriber_type,

        CAST(bike_type AS STRING) AS bike_type,

        TRIM(start_station_name) AS start_station_name,

        TRIM(end_station_name) AS end_station_name

    FROM source

)

SELECT *
FROM renamed