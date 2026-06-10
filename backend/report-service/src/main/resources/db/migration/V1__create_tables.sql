-- ============================================
-- report-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS report_schema;

CREATE TABLE IF NOT EXISTS report_schema.report_definitions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    report_type VARCHAR(255) NOT NULL,
    output_format VARCHAR(255) NOT NULL,
    created_by UUID NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS report_schema.report_schedules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    report_id UUID NOT NULL,
    frequency VARCHAR(255) NOT NULL,
    cron_expression VARCHAR(255) NOT NULL,
    recipients VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

