# Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {  
  features {
     resource_group {
       prevent_deletion_if_contains_resources = false
     }   
    }
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  
}

# Création d'un groupe de ressources
module "resource_group" {
  source   = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "virtual_network" {
  source                = "./modules/virtual_network"
  virtual_network_name  = var.virtual_network_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  address_space         = var.virtual_network_address_space
  subnets               = var.subnets
}

module "postgresql" {
  source               = "./modules/postgreSQL"
  postgresql_server_name = var.postgresql_server_name
  resource_group_name    = module.resource_group.resource_group_name
  location               = var.location
  admin_username         = var.admin_username
  admin_password         = var.admin_password
  db_name                = var.db_name
  db_version             = var.db_version
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name
}

module "blob_storage" {
  source               = "./modules/blob_storage"
  resource_group_name  = var.resource_group_name
  blob_storage_name    = var.blob_storage_name
  location             = module.resource_group.location
  type                 = var.type
  subnet_id = module.virtual_network.subnet_ids["subnet_storage"]
}

module "app_service" {
  source               = "./modules/app_service"
  service_plan_name    = var.service_plan_name
  resource_group_name  = var.resource_group_name
  location             = module.resource_group.location
  web_app_name         = var.web_app_name
  subnet_id = module.virtual_network.subnet_ids["subnet_web_app"]

  # SQL CONNECTION
  database_host        = module.postgresql.postgresql_server_fqdn
  admin_password       = var.admin_password
  admin_username       = var.admin_username

  # BLOB STORAGE CONNECTION
  storage_url          = module.blob_storage.storage_blob_url
  storage_container_name = module.blob_storage.storage_container_name
  storage_account_id   = module.blob_storage.storage_account_id

  # DOCKER CONNECTION
  docker_image         = var.docker_image
  docker_registry_url  = var.docker_registry_url
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password
}

module "gateway" {
  source               = "./modules/app_gateway"
  resource_group_name  = var.resource_group_name
  physical_loc         = module.resource_group.location
  gateway_name         = var.gateway_name
  subnet_id = module.virtual_network.subnet_ids["subnet_gateway"]
  app_service_fqdn     = module.app_service.app_service_fqdn
}