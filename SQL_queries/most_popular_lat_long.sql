# determine the 100 most popular latitude and longitude locations from where casuals start their rides
# number of rides corresponding to each location is also computed
SELECT
start_lat,
start_lng,
COUNT(ride_id) AS nr_of_rides
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals` 
WHERE member_casual = 'casual'
GROUP BY start_lat, start_lng
ORDER BY nr_of_rides DESC
LIMIT 100