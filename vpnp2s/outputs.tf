output "vpn_gateway_id" {
  description = "ID of the Virtual Network Gateway"
  value       = azurerm_virtual_network_gateway.vpn_gateway.id
}

output "vpn_gateway_public_ip" {
  description = "Public IP of the VPN Gateway"
  value       = azurerm_public_ip.vpn_pip.ip_address
}