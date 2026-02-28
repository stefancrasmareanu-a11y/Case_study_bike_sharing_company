# determine ride number distributions over different times of the day for casuals and members separately
SELECT 
member_casual,
CASE
  WHEN EXTRACT(HOUR FROM started_at)<3 THEN '0-3 AM'
  WHEN EXTRACT(HOUR FROM started_at)>=3 AND EXTRACT(HOUR FROM started_at)<6 THEN '3-6 AM'
  WHEN EXTRACT(HOUR FROM started_at)>=6 AND EXTRACT(HOUR FROM started_at)<9 THEN '6-9 AM'
  WHEN EXTRACT(HOUR FROM started_at)>=9 AND EXTRACT(HOUR FROM started_at)<12 THEN '9-12 AM'
  WHEN EXTRACT(HOUR FROM started_at)>=12 AND EXTRACT(HOUR FROM started_at)<15 THEN '0-3 PM'
  WHEN EXTRACT(HOUR FROM started_at)>=15 AND EXTRACT(HOUR FROM started_at)<18 THEN '3-6 PM'
  WHEN EXTRACT(HOUR FROM started_at)>=18 AND EXTRACT(HOUR FROM started_at)<21 THEN '6-9 PM'
  WHEN EXTRACT(HOUR FROM started_at)>=21 THEN '9-12 PM' END as time_of_day,
CASE WHEN member_casual = 'member' 
  THEN 100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'member')
 ELSE 100*COUNT(ride_id)/(SELECT rentals_number FROM `divvy-case-study-487918.2025_divvy_rentals.temp_table_membership` WHERE member_casual = 'casual')
END as nr_of_rentals
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
GROUP BY member_casual, time_of_day