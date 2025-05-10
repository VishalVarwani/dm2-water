{{ config(materialized='table') }}

SELECT
  CASE
    WHEN wind_speed < 1 THEN 'Calm'
    WHEN wind_speed BETWEEN 1 AND 3 THEN 'Moderate'
    ELSE 'Windy'
  END AS wind_band,
  AVG(turbidity) AS avg_turbidity,
  AVG(ph) AS avg_pH
FROM {{ ref('int_weather_river_joined') }}
GROUP BY wind_band
