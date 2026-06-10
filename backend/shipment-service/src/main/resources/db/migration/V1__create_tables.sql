-- ============================================
-- shipment-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS logistics_schema;

CREATE TABLE IF NOT EXISTS logistics_schema.shipments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tracking_number VARCHAR(255) NOT NULL,
    order_id UUID NOT NULL,
    warehouse_id UUID NOT NULL,
    carrier_name VARCHAR(255) NOT NULL,
    service_level VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    ship_date TIMESTAMP NOT NULL,
    estimated_delivery TIMESTAMP NOT NULL,
    weight DECIMAL(19,2) NOT NULL,
    notes VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

