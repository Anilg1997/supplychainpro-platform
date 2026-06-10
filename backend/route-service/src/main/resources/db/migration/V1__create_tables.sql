-- ============================================
-- route-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS logistics_schema;

CREATE TABLE IF NOT EXISTS logistics_schema.routes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    route_code VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    origin VARCHAR(255) NOT NULL,
    destination VARCHAR(255) NOT NULL,
    distance_km DECIMAL(19,2) NOT NULL,
    estimated_duration DECIMAL(19,2) NOT NULL,
    transport_mode VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS logistics_schema.route_stops (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    route_id UUID NOT NULL,
    location VARCHAR(255) NOT NULL,
    stop_order INTEGER NOT NULL,
    scheduled_arrival TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

