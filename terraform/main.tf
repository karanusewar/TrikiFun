terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_network" "private_network" {
  name = "trikifun_private_network"
}

resource "docker_image" "postgres" {
  name         = "postgres:16-alpine"
  keep_locally = true
}

resource "docker_container" "db" {
  image = docker_image.postgres.image_id
  name  = "trikifun_db"
  ports {
    internal = 5432
    external = var.db_port
  }
  env = [
    "POSTGRES_DB=trikifundb",
    "POSTGRES_USER=trikifunuser",
    "POSTGRES_PASSWORD=${var.db_password}"
  ]
  networks_advanced {
    name = docker_network.private_network.name
  }
}

resource "docker_image" "redis" {
  name         = "redis:7-alpine"
  keep_locally = true
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name  = "trikifun_redis"
  ports {
    internal = 6379
    external = 6379
  }
  networks_advanced {
    name = docker_network.private_network.name
  }
}

resource "docker_container" "frontend" {
  name  = "trikifun_frontend"
  image = "trikifun:latest" # Built locally using the Dockerfile
  ports {
    internal = 80
    external = var.app_port
  }
  networks_advanced {
    name = docker_network.private_network.name
  }
  depends_on = [
    docker_container.db,
    docker_container.redis
  ]
}
