-- ============================================
-- inventory-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS inventory_schema;

CREATE TABLE IF NOT EXISTS inventory_schema.inventory_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID NOT NULL,
    warehouse_id UUID NOT NULL,
    quantity_on_hand DECIMAL(19,2) NOT NULL,
    quantity_reserved DECIMAL(19,2) NOT NULL,
    quantity_available DECIMAL(19,2) NOT NULL,
    reorder_point DECIMAL(19,2) NOT NULL,
    unit_of_measure VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS inventory_schema.stock_movements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    item_id UUID NOT NULL,
    movement_type VARCHAR(255) NOT NULL,
    quantity DECIMAL(19,2) NOT NULL,
    reference_id UUID NOT NULL,
    reference_type VARCHAR(255) NOT NULL,
    notes VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

