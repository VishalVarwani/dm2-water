{{ config(materialized='table') }}

SELECT
  date,
  city,
  AVG(temperature) AS avg_temp,
  AVG(Dissolved_Oxygen) AS avg_dissolved_oxygen
FROM {{ ref('int_weather_river_joined') }}
GROUP BY date, city