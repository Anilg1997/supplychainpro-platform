-- ============================================
-- forecast-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS planning_schema;

CREATE TABLE IF NOT EXISTS planning_schema.forecasts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID NOT NULL,
    forecast_type VARCHAR(255) NOT NULL,
    forecast_date TIMESTAMP NOT NULL,
    predicted_quantity DECIMAL(19,2) NOT NULL,
    confidence_level DECIMAL(19,2) NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

