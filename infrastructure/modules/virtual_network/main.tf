# Virtual Network
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.network_name
  location            = var.location
  resource_group_name = var.group_name
  address_space       = var.address_space
}

# Subnet
resource "azurerm_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = var.group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints
}