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

CREATE TABLE medical_histories_treatments (
    medical_history_id INTEGER,
    treatments_id INTEGER,
    CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    CONSTRAINT fk_treatment FOREIGN KEY (treatments_id) REFERENCES treatments (id),
    PRIMARY KEY (medical_history_id, treatments_id)
);

CREATE INDEX idx_patient_id ON medical_histories (patient_id);
CREATE INDEX idx_medical_history_id ON medical_histories_treatments (medical_history_id);
CREATE INDEX idx_treatments_id ON medical_histories_treatments (treatments_id);