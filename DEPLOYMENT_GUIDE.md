# TrikiFun DevOps Deployment Guide

This guide describes how to build, run, test, and monitor the TrikiFun application locally using the DevSecOps pipeline assets.

---

## 1. Prerequisites

Ensure you have the following installed on your machine:
- **Docker Desktop** (or Docker Engine + Docker Compose)
- **Node.js** (v18+ recommended)
- **Git**

---

## 2. Local Environment Validation (Phase 1)

Validate your environment prior to launching the stack:
```bash
# Verify Git
git --version

# Verify Docker
docker --version
docker compose version

# Verify Node.js & dependencies
node --version
npm --version
```

---

## 3. Testing & Code Quality (Phase 6)

Run code formatting checks, lints, and unit tests locally:
```bash
# Install development tools
npm install

# Run static quality check (ESLint)
npm run lint

# Check styling format (Prettier)
npm run format

# Execute Jest unit tests
npm run test
```

---

## 4. Building and Launching the Containerized Stack (Phases 7 & 9)

Build the Docker image and deploy using Docker Compose:
```bash
# Build & start all containers in detached mode
docker compose up --build -d
```

This starts:
- **Frontend** served by Nginx on [http://localhost:8080](http://localhost:8080)
- **Health check status** on [http://localhost:8080/health](http://localhost:8080/health)
- **PostgreSQL Database** on port `5432`
- **Redis Cache** on port `6379`
- **Prometheus Scraper** on [http://localhost:9090](http://localhost:9090)
- **Grafana Dashboards** on [http://localhost:3000](http://localhost:3000) (Default Login: `admin`/`admin`)

---

## 5. Monitoring & Verification (Phases 10 & 11)

Verify container health status:
```bash
# Check container status
docker compose ps

# View container output logs
docker compose logs frontend
```
Access the custom Grafana Dashboard on port `3000` to inspect application traffic and target host metrics.
