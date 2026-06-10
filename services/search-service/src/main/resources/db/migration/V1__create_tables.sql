-- ============================================
-- search-service - V1: Create Tables
-- ============================================

CREATE SCHEMA IF NOT EXISTS report_schema;

CREATE TABLE IF NOT EXISTS report_schema.search_indexs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    document_type VARCHAR(255) NOT NULL,
    document_id UUID NOT NULL,
    content VARCHAR(255) NOT NULL,
    metadata VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

