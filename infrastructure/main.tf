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
  features {}
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
  source   = "./modules/virtual_network"
  virtual_network_name = var.virtual_network_name
  location = var.location
  resource_group_name = module.resource_group.group_name
  address_space = var.virtual_network_address_space
  subnets = var.subnets
  depends_on = [ module.resource_group ]
}

module "postgresql" {
  source   = "./modules/postgreSQL"
  resource_group_name = module.resource_group.group_name
  location = var.location
  db_version = var.db_version
  admin_username = var.admin_username
  admin_password = var.admin_password
  storage_mb = var.storage_mb
  sku_name = var.sku_name
  db_name = var.db_name
  postgresql_server_name = var.postgresql_server_name
  depends_on = [ module.virtual_network ]
}

module "blob_storage" {
  source   = "./modules/blob_storage"
  resource_group_name = module.resource_group.group_name
  blob_storage_name = var.blob_storage_name
  location = module.resource_group.location
  type = var.type
  subnet_id = module.virtual_network.subnets["subnet_storage"]
  depends_on = [ module.virtual_network ]
}

module "app_service" {
  source   = "./modules/app_service"
  service_plan_name = var.service_plan_name
  resource_group_name = module.resource_group.group_name
  location = module.resource_group.location
  web_app_name = var.web_app_name
  subnet_id = module.virtual_network.subnets["subnet_web_app"]

  # SQL CONNECTION
  database_host = module.postgresql.postgresql_server_fqdn
  database_name = module.postgresql.db_name
  database_port = module.postgresql.database_port
  admin_password = var.admin_password
  admin_username = var.admin_username

  # BLOB STORAGE CONNECTION
  storage_url = module.blob_storage.storage_url
  storage_container_name = module.blob_storage.storage_container_name
  storage_account_id = module.blob_storage.storage_account_id

  # DOCKER CONNECTION
  docker_image = var.docker_image
  docker_registry_url = var.docker_registry_url
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password
  depends_on = [ module.virtual_network, module.postgresql ]
}

module "gateway" {
  source   = "./modules/gateway"
  resource_group_name = module.resource_group.group_name
  location = module.resource_group.location
  gateway_name = var.gateway_name
  subnet_id = module.virtual_network.subnets["subnet_gateway"]
  app_service_fqdn = module.app_service.app_service_fqdn
  depends_on = [ module.virtual_network ]
}