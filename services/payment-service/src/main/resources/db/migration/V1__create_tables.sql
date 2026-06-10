-- ============================================
-- payment-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS finance_schema;

CREATE TABLE IF NOT EXISTS finance_schema.payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    invoice_id UUID NOT NULL,
    payment_number VARCHAR(255) NOT NULL,
    amount DECIMAL(19,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    payment_method VARCHAR(255) NOT NULL,
    reference_number VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    paid_by UUID NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

