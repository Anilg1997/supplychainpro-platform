-- ============================================
-- cost-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS finance_schema;

CREATE TABLE IF NOT EXISTS finance_schema.cost_centers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    manager_id UUID NOT NULL,
    budget_amount DECIMAL(19,2) NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS finance_schema.cost_entrys (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cost_center_id UUID NOT NULL,
    cost_type VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    amount DECIMAL(19,2) NOT NULL,
    entry_date TIMESTAMP NOT NULL,
    reference_id UUID NOT NULL,
    reference_type VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

