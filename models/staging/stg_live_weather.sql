{{ config(materialized='view') }}

SELECT
  city,
  CAST(timestamp AS DATE) AS date,
  temperature,
  humidity,
  windspeed,
  weather_description
FROM {{ source('river_data_analytics', 'live_weather') }}