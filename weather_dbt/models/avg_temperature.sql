SELECT
  city,
  DATE(timestamp) AS date,
  AVG(temperature) AS avg_temp,
  MAX(humidity) AS max_humidity,
  MIN(windspeed) AS min_windspeed
FROM {{ source('river_data_analytics', 'live_weather') }}
GROUP BY city, DATE(timestamp)