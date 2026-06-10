-- ============================================
-- quality-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS quality_schema;

CREATE TABLE IF NOT EXISTS quality_schema.quality_checks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    reference_id UUID NOT NULL,
    reference_type VARCHAR(255) NOT NULL,
    check_type VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    inspector_name VARCHAR(255) NOT NULL,
    scheduled_date TIMESTAMP NOT NULL,
    result VARCHAR(255) NOT NULL,
    notes VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS quality_schema.inspection_reports (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    check_id UUID NOT NULL,
    report_number VARCHAR(255) NOT NULL,
    findings VARCHAR(255) NOT NULL,
    conclusion VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

