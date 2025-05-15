output "workspace_id" {
  description = "ID del Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.log_analytics.id
}

output "workspace_name" {
  value = azurerm_log_analytics_workspace.log_analytics.name
}

output "workspace_location" {
  value = azurerm_log_analytics_workspace.log_analytics.location
}

output "storage_account_id" {
  value = azurerm_storage_account.diag_storage.id
}

output "storage_account_name" {
  value = azurerm_storage_account.diag_storage.name
}
output "workspace_key" {
  description = "Clave secreta del Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.log_analytics.primary_shared_key
  sensitive   = true
}
