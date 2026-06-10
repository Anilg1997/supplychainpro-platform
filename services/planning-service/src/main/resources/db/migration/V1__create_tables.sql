-- ============================================
-- planning-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS planning_schema;

CREATE TABLE IF NOT EXISTS planning_schema.supply_plans (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plan_number VARCHAR(255) NOT NULL,
    plan_name VARCHAR(255) NOT NULL,
    plan_type VARCHAR(255) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_by UUID NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS planning_schema.plan_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plan_id UUID NOT NULL,
    product_id UUID NOT NULL,
    planned_quantity DECIMAL(19,2) NOT NULL,
    actual_quantity DECIMAL(19,2) NOT NULL,
    planned_date TIMESTAMP NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

