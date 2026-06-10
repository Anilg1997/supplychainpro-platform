-- ============================================
-- quarantine-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS quality_schema;

CREATE TABLE IF NOT EXISTS quality_schema.quarantine_orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quarantine_number VARCHAR(255) NOT NULL,
    reference_id UUID NOT NULL,
    reference_type VARCHAR(255) NOT NULL,
    reason VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    quarantine_date TIMESTAMP NOT NULL,
    disposition VARCHAR(255) NOT NULL,
    notes VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

