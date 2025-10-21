-- https://mystery.knightlab.com/#experienced

SELECT
    *
FROM 
    crime_scene_report
WHERE 
    city LIKE 'SQL City'
    AND type = 'murder'
    AND date = 20180115;
-- 2 witnesses
-- Last house on "Northwestern Dr"
-- Annabel, lives on "Franklin Ave"

SELECT 
    p.id, 
    p.name, 
    i.transcript
FROM 
    person AS p
    JOIN interview AS i ON p.id = i.person_id
WHERE 
    address_street_name LIKE 'Northwestern Dr'
ORDER BY 
    address_number DESC
LIMIT 1;
-- "Get Fit Now Gym" bag, membership ID starts with '48Z', gold members, car plate 'H42W'


SELECT 
    p.id, 
    p.name, 
    i.transcript
FROM 
    person AS p
    JOIN interview AS i ON p.id = i.person_id
WHERE 
    name LIKE 'Annabel%'
    AND address_street_name LIKE 'Franklin Ave';
-- January 9


SELECT 
    p.name, 
    p.license_id, 
    p.ssn
FROM 
    drivers_license AS l
    JOIN person AS p ON l.id = p.license_id
WHERE 
    plate_number LIKE 'H42W%';
-- Maxine Whitely
-- ssn: 137882671, license_id: 183779
-- Age: 21, Height: 65", Eye: Blue, Hair: Blonde, Gender: F
-- Vehicle: Toyota Prius, Plate: H42W0X


SELECT 
    p.id, 
    p.name, 
    m.membership_status, 
    i.transcript
FROM 
    get_fit_now_member AS m
    JOIN person AS p ON p.id = m.person_id
    JOIN interview AS i ON i.person_id = p.id
WHERE 
    m.id LIKE '48Z%'
    AND m.membership_status = 'gold';
-- Jeremy Bowers (ssn: 871539279)
-- Clue: Hired by a wealthy woman, red hair, Tesla Model S
-- Attended SQL Symphony Concert 3 times in December 2017


SELECT 
    *
FROM 
    drivers_license AS l
    JOIN person AS p ON l.id = p.license_id
WHERE 
    gender = 'female'
    AND hair_color = 'red'
    AND car_make = 'Tesla'
    AND car_model = 'Model S';
-- person_id = 78881, 90700, 99716


SELECT 
    *
FROM 
    facebook_event_checkin AS f
    JOIN person AS p ON p.id = f.person_id
WHERE 
    date > 20171200
    AND (person_id IN (78881, 90700, 99716))
ORDER BY 
    date;
-- Miranda Priestly (person_id: 99716)
-- license_id: 202298, address: 1883 Golden Ave, ssn: 987756388
