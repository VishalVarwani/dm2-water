{{ config(materialized='table') }}

SELECT
  temperature,
  turbidity,
  ph,
  wind_speed,
  river_temperature,
  dissolved_oxygen
FROM {{ ref('int_weather_river_joined') }}
