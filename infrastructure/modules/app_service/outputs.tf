output "app_id" {
  description = "The ID of the Windows Web App"
  value       = azurerm_windows_web_app.np_web_app.id
}

output "app_service_fqdn" {
  description = "The default hostname of the Windows Web App"
  value       = azurerm_windows_web_app.np_web_app.default_hostname
}