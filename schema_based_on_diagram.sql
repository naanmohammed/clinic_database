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

CREATE TABLE invoices (
    id INTEGER,
    total_amount DECIMAL(5,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER,
    CONSTRAINT fk_invoices FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT FK_INVOICE_ID FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    CONSTRAINT FK_TREATMENT_ID FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX idx_patient_id ON medical_histories (patient_id);
CREATE INDEX idx_medical_history_id ON medical_histories_treatments (medical_history_id);
CREATE INDEX idx_treatments_id ON medical_histories_treatments (treatments_id);
CREATE INDEX idx_invoices_id ON invoices (medical_history_id);
CREATE INDEX idx_invoice_items_id ON invoice_items (invoice_id);
CREATE INDEX idx_invoice_items_treatment ON invoice_items (treatment_id);
