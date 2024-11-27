variable "np_postgresql_server_name" {
    description = "Name given to the postgresql server"
    type = string
}

variable "np_rg_name" {
    description = "Name of the resource group in Azure"
    type = string
}

variable "np_physical_loc" {
    description = "Location of the Azure resources"
    type = string
}

variable "np_delegated_subnet_id" {
    description = "ID of the delegated sub network for the PostgreSQL Flexible Server"
    type = string
}

variable "np_admin_username" {
    description = "Username of the administrator of the PostgreSQL"
    type = string
}

variable "np_admin_password" {
    description = "Secured password of the PostgreSQL administrator"
    type = string
    sensitive = true
}

variable "np_db_name" {
    description = "Name given to the created database"
    type = string
}

variable "np_sku_name" {
    description = "SKU name"
    type = string
}

variable "np_storage_mb" {
    description = "Storage capacity for PostgreSQL in Mo"
    type = number
}

variable "np_db_version" {
    description = "Version of the PostgreSQL server"
    type = string
}










