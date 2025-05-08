{{ config(materialized='table') }}

SELECT
  DATE(Timestamp) AS date,
  ROUND(AVG(River_Temperature), 2) AS avg_river_temp,
  ROUND(AVG(Weather_Temperature), 2) AS avg_weather_temp,
  MIN(River_Temperature) AS min_river_temp,
  MAX(River_Temperature) AS max_river_temp,
  MIN(Weather_Temperature) AS min_weather_temp,
  MAX(Weather_Temperature) AS max_weather_temp,
  ROUND(AVG(Humidity), 2) AS avg_humidity,
  ROUND(AVG(Turbidity), 2) AS avg_turbidity,
  ROUND(AVG(pH), 2) AS avg_ph
FROM {{ source('river_data_analytics', 'river_weather') }}
GROUP BY DATE(Timestamp)
