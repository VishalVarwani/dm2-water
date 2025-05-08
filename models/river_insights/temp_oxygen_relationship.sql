{{ config(materialized='table') }}

SELECT
  Weather_Temperature AS air_temp,
  `Dissolved Oxygen` AS do_level
FROM {{ source('river_data_analytics', 'river_weather') }}
WHERE Weather_Temperature IS NOT NULL AND Dissolved_Oxygen IS NOT NULL