-- ============================================
-- SupplyChain Pro - PostgreSQL Schema Initialization
-- ============================================

-- Auth & User schemas
CREATE SCHEMA IF NOT EXISTS auth_schema;
CREATE SCHEMA IF NOT EXISTS user_schema;

-- Procurement schemas
CREATE SCHEMA IF NOT EXISTS supplier_schema;
CREATE SCHEMA IF NOT EXISTS procurement_schema;

-- Inventory & Warehouse schemas
CREATE SCHEMA IF NOT EXISTS inventory_schema;
CREATE SCHEMA IF NOT EXISTS warehouse_schema;

-- Order schema
CREATE SCHEMA IF NOT EXISTS order_schema;

-- Logistics schemas
CREATE SCHEMA IF NOT EXISTS logistics_schema;

-- Quality schema
CREATE SCHEMA IF NOT EXISTS quality_schema;

-- Finance schema
CREATE SCHEMA IF NOT EXISTS finance_schema;

-- Planning schema
CREATE SCHEMA IF NOT EXISTS planning_schema;

-- Report schema
CREATE SCHEMA IF NOT EXISTS report_schema;
