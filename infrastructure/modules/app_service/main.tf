provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

resource "azurerm_service_plan" "np_plan" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "B1"
  os_type             = "Linux"
}


resource "azurerm_windows_web_app" "np_web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = azurerm_service_plan.np_plan.location
  service_plan_id     = azurerm_service_plan.np_plan.id
  virtual_network_subnet_id = var.subnet_id


  app_settings = {
    DATABASE_HOST          = var.database_host
    DATABASE_USER          = var.admin_username
    DATABASE_PASSWORD      = var.admin_password

    STORAGE_ACCOUNT_URL    = var.storage_url
    STORAGE_CONTAINER_NAME = var.storage_container_name
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      docker_registry_url      = var.docker_registry_url
      docker_image_name        = var.docker_image
      docker_registry_password = var.docker_registry_password
      docker_registry_username = var.docker_registry_username
    }
  }
}

resource "azurerm_role_assignment" "app_service_storage_access" {
  principal_id         = azurerm_windows_web_app.np_web_app.identity[0].principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = var.storage_account_id
}