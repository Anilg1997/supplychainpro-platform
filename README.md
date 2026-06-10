# SupplyChain Pro Platform

Enterprise Supply Chain Management Platform built with **Spring Boot 3.3**, **Spring Cloud 2023.x**, and a microservices architecture.

## Architecture

The platform consists of **31 microservices** orchestrated with:

- **Service Registry** (Eureka Server) - Port 8761
- **Config Server** (Spring Cloud Config) - Port 8888
- **API Gateway** (Spring Cloud Gateway) - Port 8080
- **Auth Service** (JWT + RBAC) - Port 8081
- **27 Domain Services** covering the full supply chain lifecycle

## Service Map

### Infrastructure
| Service | Port | Database |
|---|---|---|
| service-registry | 8761 | - |
| config-server | 8888 | - |
| api-gateway | 8080 | Redis |
| auth-service | 8081 | PostgreSQL |

### Procurement
| Service | Port | Database |
|---|---|---|
| user-service | 8082 | PostgreSQL |
| supplier-service | 8083 | PostgreSQL |
| purchase-requisition-service | 8084 | PostgreSQL |
| purchase-order-service | 8085 | PostgreSQL |
| rfq-service | 8086 | PostgreSQL |
| contract-service | 8087 | PostgreSQL |

### Product & Inventory
| Service | Port | Database |
|---|---|---|
| product-catalog-service | 8088 | MongoDB |
| inventory-service | 8089 | PostgreSQL + Redis |
| warehouse-service | 8900 | PostgreSQL |

### Orders & Logistics
| Service | Port | Database |
|---|---|---|
| order-service | 8091 | PostgreSQL |
| return-service | 8092 | PostgreSQL |
| shipment-service | 8093 | PostgreSQL |
| route-service | 8094 | PostgreSQL |
| tracking-service | 8095 | PostgreSQL |

### Quality & Planning
| Service | Port | Database |
|---|---|---|
| quality-service | 8096 | PostgreSQL |
| quarantine-service | 8097 | PostgreSQL |
| forecast-service | 8098 | PostgreSQL |
| planning-service | 8099 | PostgreSQL |

### Finance
| Service | Port | Database |
|---|---|---|
| invoice-service | 8100 | PostgreSQL |
| payment-service | 8101 | PostgreSQL |
| cost-service | 8102 | PostgreSQL |

### Portal & Analytics
| Service | Port | Database |
|---|---|---|
| supplier-portal-service | 8103 | PostgreSQL |
| report-service | 8104 | PostgreSQL |
| analytics-service | 8105 | PostgreSQL |

### Cross-Cutting
| Service | Port | Database |
|---|---|---|
| notification-service | 8106 | MongoDB + Redis |
| audit-service | 8107 | MongoDB |
| search-service | 8108 | PostgreSQL |

## Tech Stack

- **Java 17** with Spring Boot 3.3.5
- **Spring Cloud 2023.0.3** (Eureka, Gateway, Config)
- **PostgreSQL 16** with Flyway migrations
- **MongoDB 7** for document storage
- **Redis 7** for caching
- **Apache Kafka** for event-driven messaging
- **Resilience4j** for circuit breakers and retry
- **SpringDoc OpenAPI** for API documentation
- **Prometheus + Grafana** for monitoring
- **Zipkin** for distributed tracing

## Quick Start

### Prerequisites
- Docker & Docker Compose
- Java 17+ (for local development)
- Maven 3.9+

### Running with Docker

```bash
# Clone the repository
git clone <repo-url>
cd supplychainpro-platform

# Copy environment configuration
cp .env.example .env

# Start all services
docker-compose up -d

# Check service health
docker-compose ps
```

### Building from Source

```bash
# Build all services
mvn clean package -DskipTests

# Run individual services
cd services/auth-service
mvn spring-boot:run
```

## API Gateway Routes

The API Gateway at `http://localhost:8080` routes to all services:

| Route | Service |
|---|---|
| `/api/v1/auth/**` | Auth Service (public) |
| `/api/v1/users/**` | User Service |
| `/api/v1/suppliers/**` | Supplier Service |
| `/api/v1/pr/**` | Purchase Requisition |
| `/api/v1/po/**` | Purchase Order |
| `/api/v1/rfq/**` | RFQ Service |
| `/api/v1/contracts/**` | Contract Service |
| `/api/v1/products/**` | Product Catalog |
| `/api/v1/inventory/**` | Inventory Service |
| `/api/v1/orders/**` | Order Service |
| `/api/v1/invoices/**` | Invoice Service |
| `/api/v1/payments/**` | Payment Service |
| `/api/v1/shipments/**` | Shipment Service |
| `/api/v1/tracking/**` | Tracking Service |
| `/api/v1/notifications/**` | Notification Service |

## Environment Variables

Key configuration via `.env`:

| Variable | Default | Description |
|---|---|---|
| `POSTGRES_PASSWORD` | SupplyChain@2024 | PostgreSQL password |
| `MONGO_INITDB_ROOT_PASSWORD` | Mongo@2024 | MongoDB password |
| `REDIS_PASSWORD` | Redis@2024 | Redis password |
| `JWT_SECRET` | SupplyChainPro_JWT_Min32CharSecret_2024 | JWT signing key |
| `KAFKA_BOOTSTRAP_SERVERS` | kafka:29092 | Kafka broker URL |

## Security

- JWT-based authentication with access/refresh tokens
- RBAC (Role-Based Access Control)
- API Gateway validates all JWT tokens
- User identity forwarded via headers to downstream services
- Rate limiting on API Gateway

## Monitoring

- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000 (admin/admin)
- **Zipkin**: http://localhost:9411
- **Kafka UI**: http://localhost:8090
- **pgAdmin**: http://localhost:5050

## License

MIT
