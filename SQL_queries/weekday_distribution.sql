# compute distribution of casual/member rides across the days of the week
SELECT 
member_casual,
FORMAT_DATE('%A', started_at) AS week_day,
CASE WHEN member_casual = 'member' 
  THEN 100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'member')
 ELSE 100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'casual')
END as nr_of_rentals
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
GROUP BY member_casual, week_day