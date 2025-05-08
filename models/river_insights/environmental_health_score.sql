{{ config(materialized='table') }}

SELECT
  DATE(Timestamp) AS date,
  ROUND(AVG(Dissolved_Oxygen), 2) AS avg_do,
  ROUND(AVG(pH), 2) AS avg_ph,
  ROUND(AVG(Turbidity), 2) AS avg_turbidity,
  -- Example scoring: higher DO and pH around 7 is good, lower turbidity is good
  ROUND(
    0.4 * AVG(Dissolved_Oxygen) +
    0.3 * (7 - ABS(7 - AVG(pH))) +
    0.3 * (10 - AVG(Turbidity))
  , 2) AS health_score
FROM {{ source('river_data_analytics', 'river_weather') }}
GROUP BY DATE(Timestamp)
