CREATE SCHEMA IF NOT EXISTS hospital;

CREATE TABLE hospital.patient (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE,
    contact_number VARCHAR(15)
);

CREATE TABLE hospital.doctor (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50)
);

CREATE TABLE hospital.appointment (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES hospital.patient(patient_id),
    doctor_id INT REFERENCES hospital.doctor(doctor_id),
    scheduled_at TIMESTAMP NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled')),
    UNIQUE (doctor_id, scheduled_at)
);