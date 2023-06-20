CREATE TABLE patients (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE treatments (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE medical_histories (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INTEGER,
    status VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE INDEX idx_patient_id ON medical_histories (patient_id);
