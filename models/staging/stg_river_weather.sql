{{ config(materialized='view') }}

SELECT
  CAST(`Timestamp` AS DATE) AS date,
  `River_Temperature` AS river_temperature,
  `Weather_Temperature` AS weather_temperature,
  `Humidity` AS humidity,
  `Wind Speed` AS wind_speed,
  `pH` AS ph,
  `Turbidity` AS turbidity,
  `Dissolved Oxygen` AS dissolved_oxygen,
  `Chlorophyll` AS chlorophyll
FROM {{ source('river_data_analytics', 'river_weather') }}
