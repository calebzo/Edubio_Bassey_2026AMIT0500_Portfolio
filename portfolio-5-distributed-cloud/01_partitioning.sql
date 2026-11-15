-- 1. Create a partitioned table for Appointment Logs (simulating a distributed setup where data is split by date)
CREATE TABLE hospital.appointment_logs (
    log_id SERIAL,
    appointment_id INT,
    log_date DATE NOT NULL,
    action_taken VARCHAR(50)
) PARTITION BY RANGE (log_date);

-- 2. Create the 'partitions' (chunks) for different months
CREATE TABLE hospital.appointment_logs_2026_nov PARTITION OF hospital.appointment_logs
    FOR VALUES FROM ('2026-11-01') TO ('2026-12-01');

CREATE TABLE hospital.appointment_logs_2026_dec PARTITION OF hospital.appointment_logs
    FOR VALUES FROM ('2026-12-01') TO ('2027-01-01');

-- 3. Insert some test data
INSERT INTO hospital.appointment_logs (appointment_id, log_date, action_taken) VALUES 
(1, '2026-11-15', 'Created'),
(2, '2026-11-20', 'Updated'),
(3, '2026-12-05', 'Cancelled');

-- 4. Show how the database uses "Partition Pruning" to only search the relevant chunk
EXPLAIN ANALYZE 
SELECT * FROM hospital.appointment_logs WHERE log_date = '2026-11-20';