CREATE INDEX idx_appointment_doctor ON hospital.appointment(doctor_id);
CREATE INDEX idx_appointment_scheduled_at ON hospital.appointment(scheduled_at);