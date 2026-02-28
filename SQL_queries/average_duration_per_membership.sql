# compute avergage duration of rides by casuals and members (in minutes)
SELECT
 member_casual,
 AVG(DATE_DIFF(ended_at, started_at, MINUTE)) AS avg_duration
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
GROUP BY member_casual