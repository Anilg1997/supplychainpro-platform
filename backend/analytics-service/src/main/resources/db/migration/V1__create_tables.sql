-- ============================================
-- analytics-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS report_schema;

CREATE TABLE IF NOT EXISTS report_schema.dashboards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    layout VARCHAR(255) NOT NULL,
    owner_id UUID NOT NULL,
    is_default BOOLEAN DEFAULT false NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS report_schema.kpis (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    target DECIMAL(19,2) NOT NULL,
    current_value DECIMAL(19,2) NOT NULL,
    unit VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

