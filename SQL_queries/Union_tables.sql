# merge cleaned monthly table into a full year table
# start/end station names are removed (same information already contained in station IDs)
# rides ordered chronologically
CREATE TABLE `divvy-case-study-487918.2025_divvy_rentals.full_year_rentals` AS
(SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2026_January_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_February_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_March_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_April_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_May_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_June_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_July_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_August_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_September_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_October_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_November_rentals`
UNION ALL
SELECT * EXCEPT(start_station_name, end_station_name)  FROM `divvy-case-study-487918.2025_divvy_rentals.2025_December_rentals`
ORDER BY ended_at)