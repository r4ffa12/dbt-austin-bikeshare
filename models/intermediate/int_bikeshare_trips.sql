WITH trips AS (

    SELECT *
    FROM {{ ref('stg_bikeshare_trips') }}

),

transformed AS (

    SELECT

        trip_id,

        bike_id,

        start_station_id,

        end_station_id,

        start_at,

        duration_minutes,

        subscriber_type,

        bike_type,

        start_station_name,

        end_station_name,

        -- Data da viagem
        DATE(start_at) AS trip_date,

        -- Ano
        EXTRACT(YEAR FROM start_at) AS trip_year,

        -- Mês
        EXTRACT(MONTH FROM start_at) AS trip_month,

        -- Dia da semana
        EXTRACT(DAYOFWEEK FROM start_at) AS day_of_week,

        -- Hora de início
        EXTRACT(HOUR FROM start_at) AS start_hour,

        -- Período do dia
        CASE

            WHEN EXTRACT(HOUR FROM start_at) BETWEEN 6 AND 9
                THEN 'Morning Peak'

            WHEN EXTRACT(HOUR FROM start_at) BETWEEN 10 AND 15
                THEN 'Daytime'

            WHEN EXTRACT(HOUR FROM start_at) BETWEEN 16 AND 19
                THEN 'Evening Peak'

            ELSE 'Off Peak'

        END AS time_period,

        -- Categoria da duração
        CASE

            WHEN duration_minutes < 10
                THEN '0-9 min'

            WHEN duration_minutes < 20
                THEN '10-19 min'

            WHEN duration_minutes < 30
                THEN '20-29 min'

            WHEN duration_minutes < 60
                THEN '30-59 min'

            ELSE '60+ min'

        END AS duration_category

    FROM trips

    WHERE duration_minutes > 0

)

SELECT *
FROM transformed