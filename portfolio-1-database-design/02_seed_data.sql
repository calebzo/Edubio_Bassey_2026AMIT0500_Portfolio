-- Insert Patients
INSERT INTO hospital.patient (first_name, last_name, dob, contact_number) VALUES 
('John', 'Doe', '1985-05-15', '555-0101'),
('Jane', 'Smith', '1990-08-22', '555-0102'),
('Alice', 'Johnson', '1978-11-30', '555-0103'),
('Bob', 'Brown', '2000-02-14', '555-0104');

-- Insert Doctors
INSERT INTO hospital.doctor (first_name, last_name, specialty) VALUES 
('Gregory', 'House', 'Diagnostic Medicine'),
('Meredith', 'Grey', 'General Surgery'),
('Derek', 'Shepherd', 'Neurosurgery');

-- Insert Appointments
INSERT INTO hospital.appointment (patient_id, doctor_id, scheduled_at, status) VALUES 
(1, 1, '2026-11-20 10:00:00', 'Scheduled'),
(2, 2, '2026-11-21 14:30:00', 'Completed'),
(3, 3, '2026-11-22 09:15:00', 'Cancelled'),
(4, 1, '2026-11-23 11:00:00', 'Scheduled'),
(1, 2, '2026-11-24 15:00:00', 'Scheduled');