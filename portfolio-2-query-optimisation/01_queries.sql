-- Query 1: Find all scheduled appointments for a specific doctor
EXPLAIN ANALYZE 
SELECT p.first_name, p.last_name, a.scheduled_at 
FROM hospital.appointment a
JOIN hospital.patient p ON a.patient_id = p.patient_id
WHERE a.doctor_id = 1 AND a.status = 'Scheduled';

-- Query 2: Find all appointments for a specific date
EXPLAIN ANALYZE
SELECT * FROM hospital.appointment 
WHERE scheduled_at::date = '2026-11-21';