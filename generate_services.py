#!/usr/bin/env python3
"""Generate all missing service source files for SupplyChain Pro Platform."""

import os

SERVICES = {
    "user-service": {"pkg": "user", "port": 8082, "schema": "user_schema", "has_mongo": True, "tables": [
        ("UserProfile", "user_profiles", ["UUID authUserId", "String firstName", "String lastName", "String phone", "String department", "String position", "boolean active"]),
        ("UserAddress", "user_addresses", ["UUID userId", "String addressLine1", "String city", "String state", "String country", "String postalCode", "String type"]),
    ]},
    "supplier-service": {"pkg": "supplier", "port": 8083, "schema": "supplier_schema", "has_mongo": True, "tables": [
        ("Supplier", "suppliers", ["String name", "String code", "String status", "String type", "String contactEmail", "String contactPhone", "String taxId", "String paymentTerms", "boolean active"]),
        ("SupplierContact", "supplier_contacts", ["UUID supplierId", "String firstName", "String lastName", "String email", "String phone", "String position", "boolean isPrimary"]),
    ]},
    "inventory-service": {"pkg": "inventory", "port": 8089, "schema": "inventory_schema", "has_redis": True, "tables": [
        ("InventoryItem", "inventory_items", ["UUID productId", "UUID warehouseId", "UUID binLocationId", "Double quantityOnHand", "Double quantityReserved", "Double quantityAvailable", "Double reorderPoint", "Double reorderQuantity", "String unitOfMeasure"]),
        ("StockMovement", "stock_movements", ["UUID itemId", "String movementType", "Double quantity", "UUID referenceId", "String referenceType", "String notes"]),
        ("InventoryCount", "inventory_counts", ["UUID itemId", "Double countedQuantity", "Double systemQuantity", "Double variance", "UUID countedBy", "String notes"]),
    ]},
    "warehouse-service": {"pkg": "warehouse", "port": 8900, "schema": "warehouse_schema", "tables": [
        ("Warehouse", "warehouses", ["String code", "String name", "String addressLine1", "String city", "String state", "String country", "String postalCode", "Double latitude", "Double longitude", "boolean active"]),
        ("WarehouseZone", "warehouse_zones", ["UUID warehouseId", "String code", "String name", "String zoneType", "Double capacity", "String unitOfMeasure"]),
        ("BinLocation", "bin_locations", ["UUID zoneId", "String code", "String barcode", "Double maxWeight", "Double maxVolume", "String locationType", "boolean active"]),
    ]},
    "order-service": {"pkg": "order", "port": 8091, "schema": "order_schema", "tables": [
        ("Order", "orders", ["String orderNumber", "UUID customerId", "UUID supplierId", "String status", "LocalDateTime orderDate", "LocalDateTime requiredDate", "Double subtotal", "Double taxAmount", "Double shippingAmount", "Double totalAmount", "String currency", "String shippingAddress", "String billingAddress", "String notes"]),
        ("OrderItem", "order_items", ["UUID orderId", "UUID productId", "String productCode", "String productName", "Double quantity", "Double unitPrice", "Double lineTotal", "String unitOfMeasure"]),
        ("OrderStatusHistory", "order_status_history", ["UUID orderId", "String fromStatus", "String toStatus", "UUID changedBy", "String reason"]),
    ]},
    "invoice-service": {"pkg": "invoice", "port": 8100, "schema": "finance_schema", "tables": [
        ("Invoice", "invoices", ["String invoiceNumber", "UUID purchaseOrderId", "UUID supplierId", "LocalDateTime invoiceDate", "LocalDateTime dueDate", "Double subtotal", "Double taxAmount", "Double totalAmount", "Double paidAmount", "Double balanceDue", "String status", "String currency", "String notes"]),
        ("InvoiceLineItem", "invoice_line_items", ["UUID invoiceId", "String description", "Double quantity", "Double unitPrice", "Double lineTotal"]),
    ]},
    "payment-service": {"pkg": "payment", "port": 8101, "schema": "finance_schema", "tables": [
        ("Payment", "payments", ["UUID invoiceId", "UUID purchaseOrderId", "String paymentNumber", "Double amount", "LocalDateTime paymentDate", "String paymentMethod", "String referenceNumber", "String status", "UUID paidBy", "String notes"]),
    ]},
    "cost-service": {"pkg": "cost", "port": 8102, "schema": "finance_schema", "tables": [
        ("CostCenter", "cost_centers", ["String code", "String name", "String description", "UUID managerId", "String department", "Double budgetAmount", "boolean active"]),
        ("CostEntry", "cost_entries", ["UUID costCenterId", "String costType", "String description", "Double amount", "LocalDateTime entryDate", "UUID referenceId", "String referenceType"]),
    ]},
    "return-service": {"pkg": "returns", "port": 8092, "schema": "order_schema", "tables": [
        ("ReturnOrder", "return_orders", ["String returnNumber", "UUID orderId", "UUID customerId", "String returnReason", "String status", "LocalDateTime returnDate", "LocalDateTime expectedActionDate", "String disposition", "String notes"]),
    ]},
    "shipment-service": {"pkg": "shipment", "port": 8093, "schema": "logistics_schema", "tables": [
        ("Shipment", "shipments", ["String trackingNumber", "UUID orderId", "UUID supplierId", "UUID warehouseId", "UUID carrierId", "String carrierName", "String serviceLevel", "String status", "LocalDateTime shipDate", "LocalDateTime estimatedDelivery", "LocalDateTime actualDelivery", "Double weight", "Double volume", "String originAddress", "String destinationAddress", "Double shippingCost", "String notes"]),
    ]},
    "route-service": {"pkg": "route", "port": 8094, "schema": "logistics_schema", "tables": [
        ("Route", "routes", ["String routeCode", "String name", "String origin", "String destination", "Double distanceKm", "Double estimatedDuration", "String transportMode", "String carrierName", "String status"]),
        ("RouteStop", "route_stops", ["UUID routeId", "String location", "String address", "Integer stopOrder", "LocalDateTime scheduledArrival", "LocalDateTime scheduledDeparture"]),
    ]},
    "tracking-service": {"pkg": "tracking", "port": 8095, "schema": "logistics_schema", "tables": [
        ("TrackingEvent", "tracking_events", ["UUID shipmentId", "String eventType", "String location", "String description", "Double latitude", "Double longitude", "String status"]),
        ("TrackingAlert", "tracking_alerts", ["UUID shipmentId", "String alertType", "String severity", "String message", "boolean resolved"]),
    ]},
    "quality-service": {"pkg": "quality", "port": 8096, "schema": "quality_schema", "has_mongo": True, "tables": [
        ("QualityCheck", "quality_checks", ["UUID referenceId", "String referenceType", "String checkType", "String status", "String inspectorName", "LocalDateTime scheduledDate", "LocalDateTime completedDate", "String result", "String notes"]),
        ("QualitySample", "quality_samples", ["UUID checkId", "String sampleIdentifier", "LocalDateTime sampleDate", "String sampleType", "String location", "String result", "String notes"]),
    ]},
    "quarantine-service": {"pkg": "quarantine", "port": 8097, "schema": "quality_schema", "tables": [
        ("QuarantineOrder", "quarantine_orders", ["String quarantineNumber", "UUID referenceId", "String referenceType", "String reason", "String status", "LocalDateTime quarantineDate", "LocalDateTime releaseDate", "UUID approvedBy", "String disposition", "String notes"]),
    ]},
    "forecast-service": {"pkg": "forecast", "port": 8098, "schema": "planning_schema", "has_mongo": True, "tables": [
        ("Forecast", "forecasts", ["UUID productId", "String forecastType", "String period", "LocalDateTime forecastDate", "Double predictedQuantity", "Double minQuantity", "Double maxQuantity", "Double confidenceLevel", "String status"]),
    ]},
    "planning-service": {"pkg": "planning", "port": 8099, "schema": "planning_schema", "tables": [
        ("SupplyPlan", "supply_plans", ["String planNumber", "String planName", "String planType", "LocalDateTime startDate", "LocalDateTime endDate", "String status", "UUID createdBy", "String notes"]),
        ("PlanItem", "plan_items", ["UUID planId", "UUID productId", "Double plannedQuantity", "Double actualQuantity", "Double variance", "LocalDateTime plannedDate", "String status"]),
    ]},
    "supplier-portal-service": {"pkg": "portal", "port": 8103, "schema": "supplier_schema", "has_mongo": True, "tables": [
        ("PortalDocument", "portal_documents", ["UUID supplierId", "String documentType", "String fileName", "String fileUrl", "String status", "String notes"]),
    ]},
    "report-service": {"pkg": "report", "port": 8104, "schema": "report_schema", "has_mongo": True, "tables": [
        ("ReportDefinition", "report_definitions", ["String name", "String description", "String category", "String reportType", "String queryDefinition", "String outputFormat", "String parameters", "UUID createdBy", "boolean active"]),
    ]},
    "analytics-service": {"pkg": "analytics", "port": 8105, "schema": "report_schema", "has_mongo": True, "tables": [
        ("Dashboard", "dashboards", ["String name", "String description", "String layout", "UUID ownerId", "boolean isDefault", "boolean active"]),
        ("KPI", "kpis", ["String name", "String description", "String category", "String formula", "String unit", "Double target", "Double currentValue", "String frequency", "boolean active"]),
    ]},
    "search-service": {"pkg": "search", "port": 8108, "schema": "report_schema", "tables": [
        ("SearchIndex", "search_indices", ["String documentType", "UUID documentId", "String content", "String metadata", "String status"]),
    ]},
}

BASE_PATH = os.path.dirname(os.path.abspath(__file__))

def write_file(path, content):
    """Write content to file."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'w') as f:
        f.write(content)
    print(f"  Created: {path}")

def generate_model_entity(service_name, table_name, table_schema, fields):
    """Generate a JPA entity class."""
    pkg = SERVICES[service_name]["pkg"]
    schema = SERVICES[service_name]["schema"]
    cls_name = table_name[0]
    
    fields_code = []
    getters_setters = []
    for field in fields:
        parts = field.split()
        ftype = parts[0]
        fname = parts[1]
        
        # Handle primitive types
        if ftype == "boolean":
            getter = f"    public boolean is{fname[0].upper() + fname[1:]}() {{ return {fname}; }}"
            setter = f"    public void set{fname[0].upper() + fname[1:]}(boolean {fname}) {{ this.{fname} = {fname}; }}"
        else:
            getter = f"    public {ftype} get{fname[0].upper() + fname[1:]}() {{ return {fname}; }}"
            setter = f"    public void set{fname[0].upper() + fname[1:]}({ftype} {fname}) {{ this.{fname} = {fname}; }}"
        
        fields_code.append(f"    @Column(nullable=false) private {ftype} {fname};")
        getters_setters.extend([getter, setter])
    
    entity = f"""package com.supplychainpro.{pkg}.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "{table_schema[1]}", schema = "{schema}")
public class {cls_name} {{

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

{chr(10).join(fields_code)}

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    void onCreate() {{ createdAt = LocalDateTime.now(); updatedAt = LocalDateTime.now(); }}

    @PreUpdate
    void onUpdate() {{ updatedAt = LocalDateTime.now(); }}

    public UUID getId() {{ return id; }}
    public void setId(UUID id) {{ this.id = id; }}

{chr(10).join(getters_setters)}

    public LocalDateTime getCreatedAt() {{ return createdAt; }}
    public LocalDateTime getUpdatedAt() {{ return updatedAt; }}
}}
"""
    return entity

def generate_repository(service_name, cls_name):
    """Generate a Spring Data JPA repository."""
    pkg = SERVICES[service_name]["pkg"]
    repo = f"""package com.supplychainpro.{pkg}.repository;

import com.supplychainpro.{pkg}.model.{cls_name};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface {cls_name}Repository extends JpaRepository<{cls_name}, UUID> {{
}}
"""
    return repo

def generate_controller(service_name, cls_name):
    """Generate a REST controller."""
    pkg = SERVICES[service_name]["pkg"]
    endpoint = cls_name[0].lower() + cls_name[1:] + "s"
    
    controller = f"""package com.supplychainpro.{pkg}.controller;

import com.supplychainpro.{pkg}.model.{cls_name};
import com.supplychainpro.{pkg}.repository.{cls_name}Repository;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/{endpoint.lower()}")
public class {cls_name}Controller {{

    private final {cls_name}Repository repository;

    public {cls_name}Controller({cls_name}Repository repository) {{
        this.repository = repository;
    }}

    @GetMapping
    public List<{cls_name}> findAll() {{
        return repository.findAll();
    }}

    @GetMapping("/{{id}}")
    public {cls_name} findById(@PathVariable UUID id) {{
        return repository.findById(id).orElseThrow(() -> new RuntimeException("{cls_name} not found: " + id));
    }}

    @PostMapping
    public {cls_name} create(@RequestBody {cls_name} entity) {{
        return repository.save(entity);
    }}

    @PutMapping("/{{id}}")
    public {cls_name} update(@PathVariable UUID id, @RequestBody {cls_name} entity) {{
        entity.setId(id);
        return repository.save(entity);
    }}

    @DeleteMapping("/{{id}}")
    public void delete(@PathVariable UUID id) {{
        repository.deleteById(id);
    }}
}}
"""
    return controller


def main():
    print("Generating service source files...")
    
    for service_name, config in sorted(SERVICES.items()):
        pkg = config["pkg"]
        base = os.path.join(BASE_PATH, "services", service_name, "src/main/java/com/supplychainpro", pkg)
        
        for table in config["tables"]:
            cls_name = table[0]
            table_name = table[1]
            fields = table[2]
            
            # Generate model
            model_path = os.path.join(base, "model", f"{cls_name}.java")
            model_content = generate_model_entity(service_name, cls_name, table_name, fields)
            write_file(model_path, model_content)
            
            # Generate repository
            repo_path = os.path.join(base, "repository", f"{cls_name}Repository.java")
            repo_content = generate_repository(service_name, cls_name)
            write_file(repo_path, repo_content)
            
            # Generate controller
            controller_path = os.path.join(base, "controller", f"{cls_name}Controller.java")
            controller_content = generate_controller(service_name, cls_name)
            write_file(controller_path, controller_content)
        
        print(f"  Generated {len(config['tables'])} entities for {service_name}")
    
    # Create application.yml files for services that need MongoDB config
    for service_name, config in sorted(SERVICES.items()):
        pkg = config["pkg"]
        yml_path = os.path.join(BASE_PATH, "services", service_name, "src/main/resources/application.yml")
        
        # Update yml to add MongoDB config if needed
        if config.get("has_mongo"):
            mongo_config = """
  data:
    mongodb:
      host: mongodb
      port: 27017
      database: supplychainpro
      username: ${MONGO_INITDB_ROOT_USERNAME:admin}
      password: ${MONGO_INITDB_ROOT_PASSWORD:Mongo@2024}
      authentication-database: admin
"""
            with open(yml_path, 'a') as f:
                f.write(mongo_config)
    
    print("All service files generated successfully!")

if __name__ == "__main__":
    main()
