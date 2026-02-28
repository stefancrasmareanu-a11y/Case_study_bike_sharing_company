# compute ratio of rides done by casuals/members
SELECT
member_casual,
ROUND(COUNT(ride_id)/(SELECT COUNT(ride_id) FROM`divvy-case-study-487918.2025_divvy_rentals.full_year_rentals` ),2) AS type_ratio
FROM`divvy-case-study-487918.2025_divvy_rentals.full_year_rentals` 
GROUP BY member_casual
