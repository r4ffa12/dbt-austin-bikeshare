WITH stations AS (

    SELECT *
    FROM {{ ref('stg_bikeshare_stations') }}

),

final AS (

    SELECT

        station_id,
        station_name,
        station_status,
        latitude,
        longitude,

        CASE
            WHEN latitude IS NOT NULL
             AND longitude IS NOT NULL
            THEN TRUE
            ELSE FALSE
        END AS has_valid_coordinates

    FROM stations

)

SELECT *
FROM final