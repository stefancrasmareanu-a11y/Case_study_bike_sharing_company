# create a table with all stations that appear as either start or end stations (contains IDs and names)
CREATE TABLE `divvy-case-study-487918.2025_divvy_rentals.stations_table` AS
(
SELECT 
start_station_id as station_id,
# if a station ID corresponds to multiple names, only the first one (alphabetically) is put into the table
MIN(start_station_name) as station_name
FROM
# all (distinct) start stations
( 
(SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2026_January_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_February_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_March_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_April_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_May_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_June_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_July_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_August_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_September_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_October_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_November_rentals`
UNION ALL
SELECT DISTINCT start_station_id, start_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_December_rentals`
) as start_stations
FULL JOIN 
# all (distinct) end stations
(SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2026_January_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_February_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_March_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_April_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_May_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_June_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_July_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_August_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_September_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_October_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_November_rentals`
UNION ALL
SELECT DISTINCT end_station_id, end_station_name  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_December_rentals`
) as end_stations
ON start_stations.start_station_id = end_stations.end_station_id
)
# ensure no null IDs are put into the table
WHERE start_station_id IS NOT NULL
# ensure each ID appears only once
GROUP BY station_id
# order stations by IDs alphabetically 
ORDER BY station_id
)