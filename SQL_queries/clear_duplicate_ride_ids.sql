UPDATE `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals`
# update ride_ds by concatenating them with their month to achieve unique IDs across all table
SET ride_id=CONCAT(ride_id,EXTRACT(MONTH from ended_at))
WHERE ride_id IN (
# select ride_ids that appear more than once
SELECT ride_id
FROM `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals` 
GROUP BY ride_id
HAVING COUNT(ride_id)>1)