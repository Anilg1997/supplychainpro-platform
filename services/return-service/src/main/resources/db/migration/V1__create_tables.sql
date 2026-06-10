-- ============================================
-- returns-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS order_schema;

CREATE TABLE IF NOT EXISTS order_schema.return_orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    return_number VARCHAR(255) NOT NULL,
    order_id UUID NOT NULL,
    return_reason VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    return_date TIMESTAMP NOT NULL,
    disposition VARCHAR(255) NOT NULL,
    notes VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

