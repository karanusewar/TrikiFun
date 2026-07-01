#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

HEALTH_URL="http://localhost:8080/health"
MAX_ATTEMPTS=5
WAIT_SECONDS=5

echo "==========================================="
echo "Executing Phase 11 & 12: Deployment & Recovery Validation"
echo "==========================================="

check_health() {
    local attempt=1
    while [ $attempt -le $MAX_ATTEMPTS ]; do
        echo "Checking application health (Attempt $attempt/$MAX_ATTEMPTS)..."
        
        # Check HTTP status code
        STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$HEALTH_URL" || echo "000")
        
        if [ "$STATUS" -eq 200 ]; then
            echo "✓ Health Check PASS: Frontend is up and returning HTTP 200."
            return 0
        fi
        
        echo "⚠️ Attempt failed. Status code returned: $STATUS. Retrying in ${WAIT_SECONDS}s..."
        sleep $WAIT_SECONDS
        attempt=$((attempt + 1))
    done
    return 1
}

if check_health; then
    echo "Deployment is fully healthy and verified!"
    exit 0
else
    echo "❌ Deployment FAILED. Starting Phase 12 - Failure Recovery..."
    
    echo "Collecting container logs..."
    docker compose logs --tail=100 > deployment_failure_logs.txt
    echo "Logs saved to deployment_failure_logs.txt."
    
    echo "Rolling back Docker containers..."
    # Revert to previous working version or shut down current deployment to avoid broken state
    docker compose down
    
    echo "Rollback successful. Container stack stopped to prevent data loss."
    exit 1
fi
