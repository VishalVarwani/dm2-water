{{ config(materialized='table') }}

SELECT
  date,
  city,
  AVG(temperature) AS avg_temp,
  MAX(river_temperature) AS max_river_temp,
  MIN(pH) AS min_pH,
  MAX(Turbidity) AS max_turbidity
FROM {{ ref('int_weather_river_joined') }}
GROUP BY date, city