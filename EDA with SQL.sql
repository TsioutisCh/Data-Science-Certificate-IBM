-- Task 1: Display the names of the unique launch sites in the space mission.
SELECT DISTINCT Launch_Site
AS "Unique Launch Sites"
FROM SPACEXDATASET;

-- Task 2: Display 5 records where launch sites begin with the string 'CCA'.
SELECT * FROM SPACEXDATASET
WHERE Launch_Site LIKE 'CCA%' LIMIT 5;

-- Task 3: Display the total payload mass carried by boosters launched by NASA (CRS).
SELECT SUM(PAYLOAD_MASS__KG_) AS "Total Payload Mass"
FROM SPACEXDATASET WHERE Customer = 'NASA (CRS)';

-- Task 4: Display average payload mass carried by booster version F9 v1.1.
SELECT AVG(PAYLOAD_MASS__KG_) AS "Average Payload Mass"
FROM SPACEXDATASET WHERE Booster_Version = 'F9 v1.1';

-- Task 5: List the date when the first successful landing outcome in ground pad was achieved.
SELECT MIN(Date) AS "Date of first successful drone ship landing"
FROM SPACEXDATASET WHERE Landing__Outcome = 'Success (drone ship)';

-- Task 6: List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000.
SELECT Booster_Version
AS "Names of boosters with successful drone ship landings and payload mass between 4000 and 6000"
FROM SPACEXDATASET WHERE Landing__Outcome = 'Success (ground pad)' AND PAYLOAD_MASS__KG_ BETWEEN 4000 AND 6000;

-- Task 7: List the total number of successful and failure mission outcomes.
SELECT COUNT(Mission_Outcome) AS "Successful Mission Outcomes"
FROM SPACEXDATASET WHERE (Mission_Outcome LIKE '%Success%');

SELECT COUNT(Mission_Outcome) AS "Failed Mission Outcomes"
FROM SPACEXDATASET WHERE (Mission_Outcome LIKE '%Failure%');

-- Task 8: List the names of the booster_versions which have carried the maximum payload mass. Use a subquery.
SELECT DISTINCT Booster_Version AS "Booster Version",
PAYLOAD_MASS__KG_ AS "Payload Mass" 
FROM SPACEXDATASET WHERE PAYLOAD_MASS__KG_ = (SELECT MAX(PAYLOAD_MASS__KG_) FROM SPACEXDATASET);

-- Task 9: List the failed landing_outcomes in drone ship, their booster versions, and launch site names for year 2015.
SELECT Booster_Version AS "Booster Version",
Launch_Site AS "Launch Site", Landing__Outcome AS "Landing Outcome"
FROM SPACEXDATASET WHERE (Landing__Outcome LIKE '%Failure%')
AND DATE LIKE '%2015%';

-- Task 10: Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order.
SELECT Landing__Outcome AS "Type of Landing Outcome",
COUNT(Landing__Outcome) AS "Occurences"
FROM SPACEXDATASET WHERE (Date >= '2010-06-04') AND (Date <= '2017-03-20')
GROUP BY Landing__Outcome 
ORDER BY "Occurences" DESC;
