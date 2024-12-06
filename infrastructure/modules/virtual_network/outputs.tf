output "vnet_id" {
  description = "ID du réseau virtuel"
  value       = azurerm_virtual_network.virtual_network.id
}

output "vnet_name" {
  description = "Nom du réseau virtuel"
  value       = azurerm_virtual_network.virtual_network.name
}

output "subnet_ids" {
  description = "IDs des sous-réseaux"
  value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.id }
}