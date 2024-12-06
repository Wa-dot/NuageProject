output "resource_group_id" {
  description = "Resource group ID"
  value       = azurerm_resource_group.resource_group.id
}

output "group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.resource_group.name
}

output "location" {
  description = "Resource group and modules physical location"
  value       = azurerm_resource_group.resource_group.location
}