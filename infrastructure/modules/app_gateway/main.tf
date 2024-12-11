resource "azurerm_public_ip" "np_public_ip" {
  name                = "np_public_ip"
  resource_group_name = var.resource_group_name
  location            = var.physical_loc
  allocation_method   = "Static"
}

resource "azurerm_application_gateway" "np_app_gateway" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.physical_loc
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "front-port-name"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.np_public_ip.id
  }

  backend_address_pool {
    name = "backend-address-pool"
    fqdns = [ var.app_service_fqdn]
  }

  backend_http_settings {
    name                  = "backend-http-settings"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "listener-np"
    frontend_ip_configuration_name = "frontend-ip-config"
    frontend_port_name             = "frontend-port-name"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routing-rule-name"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "listener-np"
    backend_address_pool_name  = "backend-address-pool"
    backend_http_settings_name = "backend-http-settings"
  }
}