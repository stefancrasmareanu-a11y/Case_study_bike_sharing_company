# determine the top 5 most popular end stations for casuals
# and the percentage of casual rides that ended there
SELECT 
station_name, 
nr_of_rides
FROM
# first table lists the IDs of top 5 most popular end stations for casual riders
# and the percentage of rides that ended at those stations
(SELECT 
end_station_id, 
100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'casual') AS nr_of_rides
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals` 
WHERE member_casual = 'casual'
GROUP BY end_station_id
ORDER BY nr_of_rides DESC
LIMIT 5 
) AS rentals_table
# second table links the station IDs to their name
JOIN `divvy-case-study-487918.2025_divvy_rentals.stations_table` AS stations_table
ON rentals_table.end_station_id = stations_table.station_id