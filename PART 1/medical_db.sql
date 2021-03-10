

DROP DATABASE IF EXISTS medical_db;

CREATE DATABASE medical_db;

\c medical_db

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    patient Text NOT NULL
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    doctor TEXT NOT NULL
);

CREATE TABLE doctors_patients
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    patient_id INTEGER NOT NULL REFERENCES patients
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    diagnosis TEXT NOT NULL,
    treatment TEXT
);

CREATE TABLE patient_diagnoses
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    diagnosis_id INTEGER REFERENCES diagnoses
);

INSERT INTO patients (patient) VALUES ('Jeffery Gregson'),('Greg Jefferson');
INSERT INTO doctors (doctor) VALUES ('Doc Brown'),('Bugs Bunny');
INSERT INTO doctors_patients (patient_id, doctor_id) VALUES (1,2);
INSERT INTO doctors_patients (patient_id, doctor_id) VALUES (2,1);
INSERT INTO diagnoses (diagnosis, treatment) VALUES ('Death', 'Burial');
INSERT INTO diagnoses (diagnosis, treatment) VALUES ('Life', 'Death');
INSERT INTO patient_diagnoses (patient_id, diagnosis_id) VALUES (1,2);
INSERT INTO patient_diagnoses (patient_id, diagnosis_id) VALUES (1,1);
INSERT INTO patient_diagnoses (patient_id, diagnosis_id) VALUES (2,1);