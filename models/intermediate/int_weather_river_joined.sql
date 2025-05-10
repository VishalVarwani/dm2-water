{{ config(materialized='view') }}

SELECT
  lw.date,
  lw.city,
  lw.temperature,
  lw.humidity AS weather_humidity,
  lw.windspeed AS wind_speed,  -- ✅ rename here
  rw.river_temperature,
  rw.weather_temperature,
  rw.humidity AS river_humidity,
  rw.ph,
  rw.turbidity,
  rw.dissolved_oxygen,
  rw.chlorophyll
FROM {{ ref('stg_live_weather') }} lw
LEFT JOIN {{ ref('stg_river_weather') }} rw
  ON lw.date = rw.date
