SELECT
    column_name,
    data_type
FROM `bigquery-public-data.austin_bikeshare.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'bikeshare_stations'
ORDER BY ordinal_position