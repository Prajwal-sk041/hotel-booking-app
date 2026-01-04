# ��� Hotel Booking Application

**Managed by: PRAJWAL S K**

A full-stack hotel booking application built with modern technologies, featuring microservices architecture, containerization, and cloud-native deployment capabilities.

---

## ��� Screenshots

### Application UI
![Hotel Booking App](docs/images/app-screenshot.png)

### Architecture Diagram


---

## ��� Features

### Current Features (v1.0)
- ✅ Browse available hotels with beautiful UI
- ✅ View hotel details (name, location, rating, price, availability)
- ✅ Responsive design (mobile, tablet, desktop)
- ✅ Real-time data from REST API
- ✅ Health monitoring endpoints
- ✅ Containerized microservices architecture
- ✅ Database persistence with PostgreSQL
- ✅ Redis caching layer

### Upcoming Features (Roadmap)
- ��� User authentication (Login/Register)
- ��� Booking functionality with date selection
- ��� Payment integration
- ��� Search and filter hotels
- ��� User dashboard and booking history
- ��� Admin panel for hotel management
- ��� Email notifications
- ��� Reviews and ratings system

---

## ���️ Technology Stack

### Frontend
| Technology | Version | Purpose |
|------------|---------|---------|
| **React** | 18.2.0 | UI framework |
| **React DOM** | 18.2.0 | DOM rendering |
| **Axios** | 1.6.0 | HTTP client |
| **React Router** | 6.20.0 | Client-side routing |

### Backend
| Technology | Version | Purpose |
|------------|---------|---------|
| **Node.js** | 20.x | JavaScript runtime |
| **Express** | 4.18.2 | Web framework |
| **PostgreSQL** | 15 | Relational database |
| **Redis** | 7 | Caching layer |
| **Helmet** | 7.1.0 | Security middleware |
| **Morgan** | 1.10.0 | HTTP logger |
| **CORS** | 2.8.5 | Cross-origin support |

### DevOps & Infrastructure
| Technology | Purpose |
|------------|---------|
| **Docker** | Containerization |
| **Docker Compose** | Multi-container orchestration |
| **Kubernetes** | Container orchestration (planned) |
| **Terraform** | Infrastructure as Code |
| **AWS** | Cloud platform (EC2, RDS, ECS) |
| **GitHub Actions** | CI/CD pipeline (planned) |

---

## ��� Project Structure


┌─────────────────────────────────────────────────────────┐
│                    HOTEL BOOKING APP                     │
└─────────────────────────────────────────────────────────┘
│
┌───────────────────┼───────────────────┐
│                   │                   │
▼                   ▼                   ▼
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│   Frontend   │    │   Backend    │    │   Database   │
│  React App   │───▶│  Node.js API │───▶│  PostgreSQL  │
│  Port: 3000  │    │  Port: 5000  │    │  Port: 5432  │
└──────────────┘    └──────────────┘    └──────────────┘
│
▼
┌──────────────┐
│    Redis     │
│    Cache     │
│  Port: 6379  │
└──────────────┘

---

## ��� Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Docker Desktop** (v24.x or higher)
  - Download: https://www.docker.com/products/docker-desktop
- **Git** (v2.x or higher)
  - Download: https://git-scm.com/downloads
- **Node.js** (v18.x or higher) - Optional for local development
  - Download: https://nodejs.org/
- **AWS CLI** (v2.x or higher) - For cloud deployment
  - Download: https://aws.amazon.com/cli/

### Verify Installation

```bash
# Check Docker
docker --version
docker compose version

# Check Git
git --version

# Check Node.js (optional)
node --version
npm --version

# Check AWS CLI (optional)
aws --version

hotel-booking-app/
├── application/
│   ├── backend/
│   │   ├── Dockerfile
│   │   ├── package.json
│   │   ├── server.js
│   │   └── ...
│   └── frontend/
│       ├── Dockerfile
│       ├── package.json
│       ├── public/
│       │   └── index.html
│       └── src/
│           ├── App.js
│           ├── App.css
│           ├── index.js
│           └── index.css
├── kubernetes/
│   ├── deployments/
│   ├── services/
│   ├── configmaps/
│   └── ingress/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
├── scripts/
│   ├── setup.sh
│   ├── deploy.sh
│   └── cleanup.sh
├── docker-compose.yml
├── .gitignore
└── README.md

---

## **Additional Documentation Files**

### **Create CHANGELOG.md**

```bash
cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-01-05

### Added
- Initial release of Hotel Booking Application
- Frontend React application with responsive design
- Backend Node.js/Express REST API
- PostgreSQL database integration
- Redis caching layer
- Docker containerization for all services
- Docker Compose orchestration
- Health check endpoints
- Hotel listing functionality
- Beautiful gradient UI with hotel cards
- API documentation

### Infrastructure
- Project structure setup
- Git repository initialization
- Docker and Docker Compose configuration
- Database and cache setup
- Multi-stage Docker builds for optimization

## [0.1.0] - 2026-01-04

### Added
- Project initialization
- Repository setup
- Basic folder structure
