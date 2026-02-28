# temporary table to compute number of rides made by casuals and members
SELECT 
member_casual,
COUNT(ride_id) AS rentals_number
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
GROUP BY member_casual