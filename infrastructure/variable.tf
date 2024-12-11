# Provider
variable "subscription_id" {
  type        = string
  description = "Azure subscription id "
}
variable "tenant_id" {
  type        = string
  description = "Azure tenant id"
}

# Resource Group
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "nuage_resource_group"
}

# Blob Storage
variable "blob_storage_name" {
    type        = string
    description = "Blob storage name in Microsoft Azure"
    default     = "nuage_blob_storage"
}
variable "type" {
    type        = string
    description = "Type of blob storage"
    default     = "Block"
}

# Virtual network
variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}
variable "virtual_network_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Subnet
variable "subnets" {
  description = "Liste des sous-réseaux"
  type        = list(object({
    name              = string
    address_prefixes  = list(string)
    service_endpoints = list(string)
  }))
  default = [
    {
      name              = "subnet_storage",
      address_prefixes  = ["10.0.1.0/24"],
      service_endpoints = ["Microsoft.Storage"]
    },
    {
      name              = "subnet_web_app",
      address_prefixes  = ["10.0.2.0/24"],
      service_endpoints = ["Microsoft.WebApp"]
    },
    {
      name              = "subnet_gateway",
      address_prefixes  = ["10.0.3.0/24"],
      service_endpoints = ["Microsoft.GateWay"]
    },
    {
      name              = "subnet_blob_storage",
      address_prefixes  = ["10.0.4.0/24"],
      service_endpoints = ["Microsoft.BlobStorage"]
    }
  ]
}

# App Service
variable "service_plan_name" {
  description = "Name of the service plan"
  type        = string
  default     = "nuage_service_plan"
}
variable "web_app_name" {
  description = "Name of the app service"
  type        = string  
  default     = "nuage_app_service"
}

# PostgreSQL
variable "postgresql_server_name" {
    description = "Name given to the postgresql server"
    type        = string
    default     = "nuage_postgresql_server"
}
variable "admin_username" {
    description = "Username of the administrator of the PostgreSQL"
    type        = string
}
variable "admin_password" {
    description = "Secured password of the PostgreSQL administrator"
    type        = string
    sensitive   = true
}
variable "db_name" {
    description = "Name given to the created database"
    type        = string
    default     = "nuage_database"
}
variable "db_port" {
    description = "Port given to the created database"
    type        = string
    default     = 5130
}
variable "sku_name" {
    description = "SKU name"
    type        = string
}
variable "storage_mb" {
    description = "Storage capacity for PostgreSQL in Mo"
    type        = number
    default     = 51200
}
variable "db_version" {
    description = "Version of the PostgreSQL server"
    type        = string
    default     = "11"
}
variable "location" {
    description = "Location of the Azure resources"
    type        = string  
}

# Gateway
variable "gateway_name" {
    description = "Name of the gateway"
    type        = string 
    default     = "nuage_gateway"
}

# Docker
variable "docker_image" {
    description = "Docker image"
    type        = string
    default     = "index.docker.io/Wa-dot/NuageProject:latest"
}
variable "docker_registry_url" {
    description = "Docker registry URL"
    type        = string
    default     = "https://index.docker.io/v1/"
}
variable "docker_registry_username" {
    description = "Docker registry username"
    type        = string
}
variable "docker_registry_password" {
    description = "Docker registry password"
    type        = string
    sensitive   = true
}