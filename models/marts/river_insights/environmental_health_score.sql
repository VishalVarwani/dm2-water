{{ config(materialized='table') }}

SELECT
  date,
  city,
  -- Normalize and calculate weighted environmental health score
  ROUND(
    0.25 * (1 - ABS(pH - 7) / 7) +
    0.25 * (Dissolved_Oxygen / 14) +
    0.25 * (1 - (Turbidity / 100)) +
    0.25 * (1 - (Chlorophyll / 50)), 2
  ) AS health_score
FROM {{ ref('int_weather_river_joined') }}