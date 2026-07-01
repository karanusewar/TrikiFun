# TrikiFun - Children's Party Magic in Athens

TrikiFun is a premium single-page landing site for childrens party magic services based in Athens.

This repository is configured with a fully automated, local DevSecOps enterprise pipeline to enforce code quality, security standards, containerization, and local telemetry monitoring.

---

## 🛠️ DevOps Stack

- **Linter**: ESLint (Flat Config setup scanning HTML embedded JS)
- **Formatter**: Prettier
- **Tests**: Jest Unit Testing framework
- **Containerization**: Multi-stage `Dockerfile` (Node quality verification + production Nginx Alpine)
- **Local Orchestration**: Docker Compose
- **Security Checkers**: SonarQube & Gitleaks integrations
- **Telemetry & Monitoring**: Prometheus scraper & Grafana dashboard

---

## 🚀 Getting Started

To get started quickly, check out the detailed [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md).

### Quick Commands

Install local dev dependencies:
```bash
npm install
```

Run test suite:
```bash
npm run test
```

Start the containerized stack:
```bash
docker compose up --build -d
```
The website will be served at [http://localhost:8080](http://localhost:8080).
