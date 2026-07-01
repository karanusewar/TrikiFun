variable "db_password" {
  description = "Password for PostgreSQL Database"
  type        = string
  default     = "trikifunsecurepassword123"
  sensitive   = true
}

variable "app_port" {
  description = "Port to expose the TrikiFun website"
  type        = number
  default     = 8080
}

variable "db_port" {
  description = "Port to expose PostgreSQL database"
  type        = number
  default     = 5432
}
