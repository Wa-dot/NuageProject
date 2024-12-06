# Configures the Azure provider with subscription and tenant IDs.

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
# Création d'un groupe de ressources
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Création d'un compte de stockage
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Creates a VNet and defines subnets.
# Virtual Network Module
module "virtual_network" {
  source = "./modules/virtual_network"
}

# Blob Storage Module
module "blob_storage" {
  source = "./modules/blob_storage"
  
  # Variables requises pour le module
  resource_group_name  = module.resource_group.group_name
  location            = var.location
  subnet_id           = module.virtual_network.subnets["blob_subnet"].id
  storage_account_name = var.storage_account_name

  depends_on = [
    module.resource_group,
    module.virtual_network
  ]
}

## App Service Module

module "app_service" {
  source            = "./modules/application_service"
  service_plan_name = var.service_plan_name
  rg_name           = module.resource_group.rg_name
  physical_loc      = module.resource_group.physical_loc
  web_app_name      = var.web_app_name
  subnet_id         = module.vnet.subnets["web_app_subnet"]

  # FOR POSTGRESQL CONNECTION
  database_host  = module.postgresql.postgresql_server_fqdn
  database_port  = module.postgresql.database_port
  database_name  = module.postgresql.database_name
  admin_username = var.admin_username
  admin_password = var.admin_password

  # FOR DOCKER CONNECTION
  docker_image             = var.docker_image
  docker_registry_url      = var.docker_registry_url
  docker_registry_password = var.docker_registry_password
  docker_registry_username = var.docker_registry_username

  # STORAGE
  storage_url            = module.blob_storage.storage_url
  storage_account_id     = module.blob_storage.storage_account_id
  storage_container_name = module.blob_storage.storage_container_name 
  
  depends_on = [ module.vnet, module.postgresql ]
}

# Creates an Application Gateway and connects it to the Web App.

module "app_gateway" {
  source           = "./modules/application_gateway"
  rg_name          = module.resource_group.rg_name
  physical_loc     = module.resource_group.physical_loc
  gateway_name     = var.gateway_name
  subnet_id        = module.vnet.subnets["gateway_subnet"]
  app_service_fqdn = module.app_service.app_service_fqdn

  depends_on = [ module.vnet ]
}