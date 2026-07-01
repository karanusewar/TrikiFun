# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-07-01

### Added
- Created complete local DevSecOps pipeline files.
- Added multi-stage `Dockerfile` and secure `nginx.conf`.
- Configured local environment composition stack via `docker-compose.yml` exposing ports for Database, Cache, and Scrapers.
- Configured ESLint with browser environment and Prettier formatting standard rules.
- Configured unit test checks with Jest and test coverage reports.
- Added Terraform provider scripts (`main.tf`, `variables.tf`, `outputs.tf`) for local Docker provisioning.
- Added Kubernetes deployment, service, and ConfigMap manifests.
- Added telemetry and log shipping agents via Prometheus, Grafana, Loki, and Promtail.
- Configured Trivy security policies (`trivy.yaml`).
- Configured Gitleaks scanning rules (`.gitleaks.toml`).
- Created pipeline execution scripts: `push-to-nexus.sh`, `run-security-checks.sh`, and `recovery.sh`.
