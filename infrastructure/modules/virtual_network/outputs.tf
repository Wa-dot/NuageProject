output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value = { for name, subnet in azurerm_subnet.subnet : name => subnet.id }
}

output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.virtual_network.id
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.virtual_network.name
}