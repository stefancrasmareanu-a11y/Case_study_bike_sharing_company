# determine percentage of rides with electric bikes for members and casuals (separately)
SELECT
 member_casual,
# compute percentages
 SUM(CASE WHEN rideable_type = 'electric_bike' THEN number_of_rides ELSE 0 END)/SUM(number_of_rides) AS percentage_electic_bikes
FROM(
# first count the number of rides that members and casuals made with electric bikes
SELECT
  member_casual,
  rideable_type,
  COUNT(ride_id) as number_of_rides
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
GROUP BY member_casual, rideable_type)
GROUP BY member_casual
