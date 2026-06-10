-- ============================================
-- contract-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS procurement_schema;

CREATE TABLE IF NOT EXISTS procurement_schema.contracts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    contract_number VARCHAR(255) NOT NULL,
    supplier_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    contract_value DECIMAL(19,2) NOT NULL,
    currency VARCHAR(255) NOT NULL,
    terms VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

