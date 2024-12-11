variable "postgresql_server_name" {
    description = "Name given to the postgresql server"
    type        = string
}

variable "resource_group_name" {
    description = "Name of the resource group in Azure"
    type        = string
}

variable "location" {
    description = "Location of the Azure resources"
    type        = string
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
}

variable "sku_name" {
    description = "SKU name"
    type        = string
}

variable "storage_mb" {
    description = "Storage capacity for PostgreSQL in Mo"
    type        = number
}

variable "db_version" {
    description = "Version of the PostgreSQL server"
    type        = string
}