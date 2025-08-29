-- Step 1: Retrieve the crime report for the murder on January 15, 2018 in SQL City
SELECT date, type, description, city
FROM crime_scene_report
WHERE date = STR_TO_DATE('20180115','%Y%m%d')
AND city = 'SQL City'
AND type = 'murder';

-- From the description, we learn that:
-- - The incident occurred at 3:15 PM
-- - Two witnesses: one from the last house on Northwestern Dr, another named Annabel from Franklin Ave

-- Step 2: Identify the first witness (last house on Northwestern Dr)
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- This gives us: Morty Schapiro (first witness)

-- Step 3: Identify the second witness (Annabel from Franklin Ave)
SELECT id, name, address_street_name
FROM person
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave';

-- This gives us: Annabel Miller (second witness)

-- Step 4: Get the interview transcripts of both witnesses
SELECT i.person_id, p.name, i.transcript
FROM interview i
JOIN person p ON i.person_id = p.id
WHERE i.person_id IN (14887, 16371);  -- Morty and Annabel's IDs

-- From the transcripts, we learn:
-- - The suspect has a gold gym membership with ID starting with "48Z"
-- - The suspect checked in on January 9
-- - The suspect’s car has a license plate containing "H42W"
-- - Suspect is a male about 5'9"

-- Step 5: Find Gold gym members with ID starting with "48Z"
SELECT g.id, p.name, g.membership_status,
       DATE_FORMAT(g.membership_start_date,'%Y-%m-%d') as start_date
FROM get_fit_now_member g
JOIN person p ON g.person_id = p.id
WHERE g.id LIKE '48Z%'
AND g.membership_status = 'gold';

-- Two possible suspects found: Jeo Germuska (48Z7A) and Philip Sherman (48Z55)

-- Step 6: Check gym check-in records for Jan 9 to confirm who visited
SELECT c.membership_id, m.name,
       DATE_FORMAT(c.check_in_date,'%Y-%m-%d') as check_in,
       c.check_in_time, c.check_out_time
FROM get_fit_now_check_in c
JOIN get_fit_now_member m ON c.membership_id = m.id
WHERE c.check_in_date = STR_TO_DATE('20180109','%Y%m%d')
AND c.membership_id IN ('48Z7A','48Z55');

-- Only Philip Sherman (48Z55) visited on Jan 9 — suspect confirmed

-- Step 7: Verify license plate contains "H42W"
SELECT p.name, dl.plate_number, dl.car_make, dl.car_model
FROM person p
JOIN drivers_license dl ON p.license_id = dl.id
WHERE dl.plate_number LIKE '%H42W%';

-- Result: Philip Sherman — license matches, confirming witness account

-- Step 8: Check if he confessed
SELECT transcript FROM interview WHERE person_id = 67318;

-- Transcript confirms he confessed and was hired by a woman

-- Step 9: Find the mastermind using clues:
-- Red-haired woman, drives Tesla Model S, attended SQL Symphony Concert at least 3 times in Dec 2017

SELECT p.name, i.annual_income, dl.car_make, dl.car_model
FROM person p
JOIN drivers_license dl ON p.license_id = dl.id
JOIN income i ON p.ssn = i.ssn
WHERE dl.gender = 'female'
AND dl.hair_color = 'red'
AND dl.car_make = 'Tesla'
AND dl.car_model = 'Model S'
AND p.id IN (
    SELECT person_id
    FROM facebook_event_checkin
    WHERE event_name = 'SQL Symphony Concert'
    AND MONTH(date) = 12
    AND YEAR(date) = 2017
    GROUP BY person_id
    HAVING COUNT(*) >= 3
);

-- Result: Hazel Richardson — matches all criteria and is confirmed as the mastermind