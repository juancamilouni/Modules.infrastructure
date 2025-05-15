output "uami_id" {
  description = "ID completo de la identidad"
  value       = azurerm_user_assigned_identity.uami.id
}

output "uami_client_id" {
  description = "Client ID de la identidad"
  value       = azurerm_user_assigned_identity.uami.client_id
}

output "uami_principal_id" {
  description = "Object ID (se usa para access policies)"
  value       = azurerm_user_assigned_identity.uami.principal_id
}
