-- Hospital Admissions Dataset

-- 1. List all admissions that occurred in the "Cardiology" department in 2021
SELECT * FROM hospital_admissions WHERE department = 'Cardiology' AND YEAR(admissiondate) = 2021;

-- 2. Find the top 10 most expensive treatments in the dataset
SELECT admissionid, treatmentcost FROM hospital_admissions ORDER BY treatmentcost DESC LIMIT 10;

-- 3. What is the average length of stay for each hospital department?
SELECT department, AVG(lengthofstay) AS avg_length_of_stay FROM hospital_admissions GROUP BY department;

-- 4. Find the number of admissions for the patient "John Smith"
SELECT COUNT(*) AS john_smith_admissions FROM hospital_admissions WHERE patientname = 'John Smith';

-- 5. What is the admission with the highest treatment cost?
SELECT admissionid, treatmentcost FROM hospital_admissions ORDER BY treatmentcost DESC LIMIT 1;

-- 6. List all admissions where the length of stay is more than 10 days and the treatment cost is less than $5,000
SELECT admissionid FROM hospital_admissions WHERE lengthofstay > 10 AND treatmentcost < 5000;

-- 7. What is the total number of admissions to the "Emergency" department in 2020?
SELECT COUNT(*) AS emergency_admissions FROM hospital_admissions WHERE department = 'Emergency' AND YEAR(admissiondate) = 2020;

-- 8. Find the admission with the longest length of stay
SELECT admissionid, lengthofstay FROM hospital_admissions ORDER BY lengthofstay DESC LIMIT 1;

-- 9. What is the average treatment cost for patients older than 60 years?
SELECT AVG(treatmentcost) AS avg_treatment_cost FROM hospital_admissions WHERE age > 60;

-- 10. List all admissions in the "Pediatrics" department that had a treatment cost of $2,000 or more
SELECT admissionid FROM hospital_admissions WHERE department = 'Pediatrics' AND treatmentcost >= 2000;

-- 11. Find the top 5 cities with the highest number of admissions
SELECT city, COUNT(*) AS admissions_count 
FROM hospital_admissions 
GROUP BY city 
ORDER BY admissions_count DESC 
LIMIT 5;

-- 12. What is the average length of stay for patients who were discharged as "Recovered"?
SELECT AVG(lengthofstay) AS avg_length_of_stay FROM hospital_admissions WHERE dischargestatus = 'Recovered';

-- 13. Which admissions were for patients who did not have insurance?
SELECT admissionid FROM hospital_admissions WHERE insurance = 'No';

-- 14. What percentage of admissions had a length of stay greater than 7 days?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hospital_admissions)) AS percentage_long_stays
FROM hospital_admissions 
WHERE lengthofstay > 7;

-- 15. Find the total treatment cost for all patients admitted to "General Hospital" in 2020
SELECT SUM(treatmentcost) AS total_treatment_cost FROM hospital_admissions WHERE hospital = 'General Hospital' AND YEAR(admissiondate) = 2020;

-- 16. What is the highest treatment cost for any admission in the "Surgery" department?
SELECT admissionid, treatmentcost FROM hospital_admissions WHERE department = 'Surgery' ORDER BY treatmentcost DESC LIMIT 1;

-- 17. List admissions that have both a length of stay greater than 5 days and a treatment cost of less than $3,000
SELECT admissionid FROM hospital_admissions WHERE lengthofstay > 5 AND treatmentcost < 3000;

-- 18. What is the correlation between age and treatment cost?
SELECT CORR(age, treatmentcost) AS correlation_age_treatmentcost FROM hospital_admissions;

-- 19. Find the average treatment cost and length of stay for each department
SELECT department, AVG(treatmentcost) AS avg_treatment_cost, AVG(lengthofstay) AS avg_length_of_stay 
FROM hospital_admissions 
GROUP BY department;

-- 20. Which 5 admissions had the longest length of stay but the lowest treatment cost?
SELECT admissionid, lengthofstay, treatmentcost 
FROM hospital_admissions 
ORDER BY lengthofstay DESC, treatmentcost ASC 
LIMIT 5;
