# compute percentage of rides done by casuals/members for each month of the year
SELECT 
member_casual,
EXTRACT(MONTH FROM started_at) as month,
CASE WHEN member_casual = 'member' 
  THEN 100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'member')
 ELSE 100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'casual')
END AS nr_of_rentals
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
GROUP BY member_casual, month