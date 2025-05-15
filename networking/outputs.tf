output "vnet_id" {
  description = "ID de la VNet creada"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "Lista de IDs de las subredes creadas"
  value = { for s in azurerm_subnet.subnets : s.name => s.id }
}
