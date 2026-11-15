-- 1. Test a successful transaction (COMMIT)
BEGIN;
UPDATE hospital.appointment SET status = 'Completed' WHERE appointment_id = 1;
COMMIT;

-- 2. Test a cancelled transaction (ROLLBACK)
-- We will try to cancel an appointment, but then change our minds.
BEGIN;
UPDATE hospital.appointment SET status = 'Cancelled' WHERE appointment_id = 2;
ROLLBACK;

-- 3. See the results
-- Appointment 1 should be 'Completed'. Appointment 2 should still be 'Completed' (not Cancelled).
SELECT appointment_id, status FROM hospital.appointment WHERE appointment_id IN (1, 2);