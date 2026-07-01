output "frontend_url" {
  description = "URL to access the frontend web application"
  value       = "http://localhost:${var.app_port}"
}

output "db_endpoint" {
  description = "Database Host connection endpoint"
  value       = "localhost:${var.db_port}"
}
