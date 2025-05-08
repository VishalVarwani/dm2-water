{{ config(materialized='table') }}

SELECT
  Weather_Temperature,
  River_Temperature,
  Turbidity,
  pH
FROM {{ source('river_data_analytics', 'river_weather') }}
WHERE Weather_Temperature IS NOT NULL AND River_Temperature IS NOT NULL