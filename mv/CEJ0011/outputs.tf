output "vm_id" {
  description = "ID de la máquina virtual"
  value       = azurerm_linux_virtual_machine.cej0011.id
}

output "nic_id" {
  description = "ID de la NIC de la VM"
  value       = azurerm_network_interface.cej0011_nic.id
}

output "private_ip" {
  description = "Dirección IP privada de la VM"
  value       = var.private_ip
}

