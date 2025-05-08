{{ config(materialized='table') }}

SELECT
  ROUND(`Wind Speed`, 0) AS wind_band,
  COUNT(*) AS records,
  ROUND(AVG(Turbidity), 2) AS avg_turbidity,
  ROUND(AVG(pH), 2) AS avg_ph
FROM {{ source('river_data_analytics', 'river_weather') }}
GROUP BY wind_band