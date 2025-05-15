
output "management_group_id" {
  description = "ID del grupo de administración"
  value       = azurerm_management_group.root.id
}
