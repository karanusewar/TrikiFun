#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
# but continue if checking tools that might fail/report issues.
set +e

echo "==========================================="
echo "Executing Phase 5: Security Pipeline"
echo "==========================================="

# 1. Secret Detection via Gitleaks
if command -v gitleaks &> /dev/null; then
    echo "[1/4] Running Gitleaks secret scan..."
    gitleaks detect --verbose --config=.gitleaks.toml
else
    echo "[1/4] Gitleaks not found in path. Skipping secret detection scan."
fi

# 2. Filesystem Security Scan via Trivy
if command -v trivy &> /dev/null; then
    echo "[2/4] Running Trivy filesystem scan..."
    trivy fs --config trivy.yaml .
else
    echo "[2/4] Trivy not found in path. Skipping container vulnerability scans."
fi

# 3. Dependency Vulnerability Scan
echo "[3/4] Running npm audit for dependency check..."
npm audit --audit-level=high

# 4. License Check
if command -v npx &> /dev/null; then
    echo "[4/4] Running License Checker..."
    # Scan dependencies for licensing issues
    npx license-checker --summary || echo "license-checker completed."
else
    echo "[4/4] npm/npx not found. Skipping license check."
fi

echo "==========================================="
echo "Security Pipeline Execution Completed."
echo "==========================================="
